import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';

class TextView extends StatelessWidget {
  const TextView({
    Key key,
    @required this.label,
    @required this.content,
    this.contentStyle,
  }) : super(key: key);

  final String label;
  final String content;
  final TextStyle contentStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(color: AppColors.HINT_TEXT_FIELD_COLOR)),
        Text(content, style: contentStyle),
        Divider(color: AppColors.GREY_COLOR),
      ],
    );
  }
}
