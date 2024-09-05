import 'dart:async';

import 'package:childcaresoftware/blocs/student/student_bloc.dart';
import 'package:childcaresoftware/screens/message/message_card.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Message',
        isShowBackButton: false,
      ),
      body: _MessageScreen(),
    );
  }
}

class _MessageScreen extends StatefulWidget {
  const _MessageScreen({
    Key key,
  }) : super(key: key);
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<_MessageScreen> {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final _scrollThreshold = 0.0;
  Completer<void> _refreshCompleter;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentBloc>(
      create: (context) => StudentBloc()..add(GetBrandMyList()),
      child: BlocConsumer<StudentBloc, StudentState>(
          listenWhen: (previous, current) =>
              // previous.tagList != current.tagList ||
              previous.status != current.status,
          // previous.hasReachedMax != current.hasReachedMax ||
          // previous.brandSearchList != current.brandSearchList,
          listener: (context, state) {
            // if (!state.isRefresh) {
            //   switch (state.status) {
            //     case FormStatus.submissionInProgress:
            //       Dialogs.showLoadingDialog(context);
            //       break;
            //     case FormStatus.submissionSuccess:
            //       Dialogs.hideDialog(context);
            //       break;
            //     case FormStatus.submissionFailure:
            //       Dialogs.hideDialog(context);
            //       Dialogs.showErrorDialog(context, state.messageStatus);
            //       break;
            //     default:
            //   }
            // } else {
            //   if (state.status == FormStatus.submissionSuccess) {
            //     _refreshCompleter?.complete();
            //     _refreshCompleter = Completer();
            //   }
            // }
          },
          // buildWhen: (previous, current) =>
          //     previous.tagList != current.tagList ||
          //     previous.brandSearchList != current.brandSearchList,
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MessageCard(
                      title: "All Staff & Parents",
                      icon: Icons.groups_outlined,
                    ),
                    MessageCard(
                      title: "Admin & Parents",
                      icon: Icons.child_care_rounded,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // final hasReachedMax =
    // BlocProvider.of<JobsSavedBloc>(context).state.hasReachedMax;
    // if (maxScroll == currentScroll && !hasReachedMax) {
    // BlocProvider.of<JobsSavedBloc>(context).add(JobsSavedDataFetched());
    // }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
