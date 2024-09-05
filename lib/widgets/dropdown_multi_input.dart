import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/multi_select.dart';

class DropdownMultiInput extends StatelessWidget {
  DropdownMultiInput({
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
  final List<dynamic> initItem;
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
                      child: MultiSelectCustom(
                        filterable: false,
                        value: this.initItem,
                        titleText: this.label,
                        titleTextColor: AppColors.BLACK,
                        isShowSelectedOptions: false,
                        autovalidate: false,
                        dataSource: itemList,
                        textField: 'name',
                        valueField: 'id',
                        onSaved: (value) {
                          this.action(value);
                        },
                        selectIcon: Icons.arrow_drop_down_circle,
                        open: () {
                          print('The value is open');
                        },
                      ),
                    )
                  ],
                ))
          ]),
    );
  }
}
