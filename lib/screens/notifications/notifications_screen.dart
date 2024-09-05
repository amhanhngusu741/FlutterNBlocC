import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/style.dart';
import 'package:childcaresoftware/blocs/notifications/notifications_bloc.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:childcaresoftware/screens/notifications/notifications_router.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: _NotifcationList(),
      ),
    );
  }
}

class _NotifcationList extends StatefulWidget {
  const _NotifcationList({
    Key key,
  }) : super(key: key);

  @override
  _NotifcationListState createState() => _NotifcationListState();
}

class _NotifcationListState extends State<_NotifcationList> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
        listener: (context, state) {
      if (state.status == FormStatus.submissionSuccess) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      }
    }, builder: (context, state) {
      return new RefreshIndicator(
          child: state.notificationList.length > 0
              ? new ListView.builder(
                  itemCount: state.notificationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _NotificationCard(
                      item: state.notificationList[index],
                      color: state.notificationList[index].read == 1
                          ? AppColors.WHITE
                          : AppColors.GREY,
                      action: (id, value) {
                        context
                            .read<NotificationsBloc>()
                            .add(NotificationsMarkAsRead(id: id));
                        switch (value['action']) {
                          case 'JOB_DETAIL':
                            Navigator.pushNamed(
                                context, NotificationRouter.JOBS_DETAIL,
                                arguments: null);
                            // JobDetailScreenArguments(
                            //     jobId: int.parse(value['jid']),
                            //     positionId: int.parse(value['pid'])));
                            break;
                          default:
                        }
                      },
                    );
                  },
                )
              : Stack(
                  children: [
                    ListView(),
                    Center(
                      child: Container(
                        child: Text(
                          'NO NOTIFICATION',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.PRIMARY),
                        ),
                      ),
                    ),
                  ],
                ),
          onRefresh: () {
            context.read<NotificationsBloc>().add(NotificationsStarted());
            return _refreshCompleter.future;
          });
    });
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final Color color;
  final Function action;

  const _NotificationCard(
      {Key key, @required this.item, this.color, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.read == 0) action(item.id, item.actionMobile);
      },
      child: Container(
        color: this.color,
        height: 80,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: _PrefixImage(type: item.event),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                    child: Text(
                      item.timeAgo,
                      style: TextStyle(fontSize: 12, color: AppColors.PRIMARY),
                    ),
                  ),
                  Html(
                    data: item.message,
                    style: {
                      "html": Style(
                        fontSize: FontSize(13),
                        // backgroundColor: AppColors.RED,
                      ),
                      "b": Style(
                        color: AppColors.BLACK,
                      )
                    },
                  )
                ],
              ),
              // )
            )
          ],
        ),
      ),
    );
  }
}

class _PrefixImage extends StatelessWidget {
  const _PrefixImage({
    Key key,
    this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'project_create':
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.LIGHT_BLUE,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.business_center,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
      case 'manager_project_approve':
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.GREEN,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
      case "client_invite":
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.RED,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.close,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
      case "seeker_cancel":
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.DEEP_BLUE,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.send,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
      case "seeker_accept":
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.PURPLE,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.receipt,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
      case "agency_register":
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.PURPLE,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.receipt,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
      case "approve_branch":
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.PURPLE,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.receipt,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
      default:
        return Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.GREEN,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            size: 40,
            color: AppColors.WHITE,
          ),
        );
        break;
    }
    // return Container();
  }
}
