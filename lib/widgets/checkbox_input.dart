import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:childcaresoftware/constants/color.dart';

class CheckBoxInput extends StatelessWidget {
  CheckBoxInput({
    Key key,
    @required this.label,
    this.lableStyle,
    this.action,
    this.checked = false,
  }) : super(key: key);

  final String label;
  final bool checked;
  final TextStyle lableStyle;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                      contentPadding: EdgeInsets.all(0),
                      leading: Transform.translate(
                        offset: Offset(-2.0, 0.0),
                        child: Icon(
                          checked
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: AppColors.GREEN_BUTTON,
                        ),
                      ),
                      title: Transform.translate(
                        offset: Offset(-20.0, 0.0),
                        child: Text(label, style: lableStyle),
                      ),
                      onTap: () {
                        this.action(!checked);
                      },
                    ),
                  ),
                ),
              ],
            ))
          ]),
    );
  }
}
