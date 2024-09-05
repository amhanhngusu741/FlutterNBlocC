import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';

class DropdownLable extends StatelessWidget {
  DropdownLable({
    Key key,
    @required this.label,
    this.hint = 'Select a value',
    this.value = '',
    this.labelStyle,
    this.valueStyle,
    this.isReadOnly = false,
    this.rate = const [5, 5],
    this.action,
    this.valueList = const [],
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  final String label;
  final String hint;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final bool isReadOnly;
  final List<int> rate;
  final Function action;
  final List<dynamic> valueList;
  final Color backgroundColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(235, 238, 241, 1), spreadRadius: 1),
        ],
      ),
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: rate[0],
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      label,
                      style: labelStyle,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: rate[1],
                child: Column(
                  children: <Widget>[
                    IgnorePointer(
                      ignoring: isReadOnly,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: borderColor,
                              style: BorderStyle.solid,
                              width: 0.8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: Container(
                            color: backgroundColor,
                            padding: EdgeInsets.only(left: 10, right: 15),
                            child: DropdownButton<String>(
                              value: value,
                              isExpanded: true,
                              hint: Text(hint),
                              items: valueList.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(
                                    value,
                                    style: valueStyle,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                this.action(value);
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ))
          ]),
    );
  }
}
