import 'dart:async';

import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/style.dart';

import '../../blocs/blocs.dart';
import 'message_router.dart';

class MessageCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Action action;
  const MessageCard({
    Key key,
    this.title,
    this.icon,
    this.action,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _MessageCard(title: title, icon: icon, action: action),
    );
  }
}

class _MessageCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Action action;
  const _MessageCard({Key key, this.title, this.icon, this.action})
      : super(key: key);

  @override
  _MessageCardState createState() => _MessageCardState();
}

class _MessageCardState extends State<_MessageCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 8, bottom: 8, left: 8),
      child: Stack(children: [
        GestureDetector(
          onTap: () =>
              {Navigator.pushNamed(context, MessageRouter.SEND_MESSAGE_SCREEN)},
          child: Container(
            margin: EdgeInsets.only(left: 50, top: 10),
            height: 50,
            width: MediaQuery.of(context).size.width - 66,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.WHITE,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(235, 238, 241, 1), spreadRadius: 1),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    // textScaleFactor: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.WHITE,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(235, 238, 241, 1), spreadRadius: 1),
              ],
            ),
            child: CircleAvatar(
              radius: 0,
              backgroundColor: Color.fromRGBO(222, 243, 242, 1),
              child: ClipOval(
                child: Icon(widget.icon,
                    size: 25, color: AppColors.PRIMARY_TRANSPARENT),
              ),
            ))
      ]),
    );
  }
}
