import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:childcaresoftware/constants/color.dart';

class DropdownInput extends StatelessWidget {
  DropdownInput({
    Key key,
    @required this.label,
    @required this.initItem,
    this.contentStyle,
    this.maxLine = 1,
    this.rate = const [5, 5],
    this.saved,
    this.action,
    this.isValidator = false,
    this.isNumber = false,
    this.validatorMsg = '',
    this.isDropdownList = false,
    this.itemList,
    this.value = '',
    this.maxLength = 0,
    this.hint = '',
  })  : valueController = TextEditingController(text: value),
        super(key: key);

  final String label;
  final String value;
  final TextStyle contentStyle;
  final int maxLine;
  final List<int> rate;
  final Function saved;
  final Function action;
  final bool isValidator;
  final String validatorMsg;
  final String initItem;
  final bool isNumber;
  final valueController;
  final bool isDropdownList;
  final List<dynamic> itemList;
  final int maxLength;
  final String hint;
  @override
  Widget build(BuildContext context) {
    valueController.selection = TextSelection.fromPosition(
        TextPosition(offset: valueController.text.length));
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                      style: contentStyle,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: rate[1],
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.BLACK),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: new DropdownButton<String>(
                          underline: SizedBox(),
                          value: initItem,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                            color: AppColors.BLACK,
                          ),
                          // iconSize: 24,
                          // elevation: 16,
                          style:
                              TextStyle(fontSize: 16, color: AppColors.BLACK),
                          isExpanded: true,
                          hint: new Text(this.hint),
                          items: itemList.map((value) {
                            return new DropdownMenuItem<String>(
                              value: value['value'].toString(),
                              child: new Text(value['label']),
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                            // this.action(value);
                          },
                        ),
                      ),
                    )
                  ],
                ))
          ]),
    );
  }
}
