import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class TextInput extends StatelessWidget {
  TextInput({
    Key key,
    @required this.label,
    this.contentStyle,
    this.maxLine = 1,
    this.rate = const [5, 5],
    this.saved,
    this.action,
    this.isValidator = false,
    this.isNumber = false,
    this.validatorMsg = '',
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
  final bool isNumber;
  final valueController;
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                            filled: true,
                            fillColor: AppColors.WHITE,
                            hintText: this.hint,
                            enabledBorder: new OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                borderSide:
                                    new BorderSide(color: AppColors.BLACK)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              borderSide:
                                  BorderSide(width: 1, color: AppColors.BLACK),
                            ),
                            // prefixIcon: Icon(
                            //   Icons.stacked_bar_chart,
                            //   color: AppColors.PRIMARY,
                            //   size: 30,
                            // )
                          ),
                          onChanged: (value) => {this.action(value)}),
                    ),
                  ],
                ))
          ]),
    );
  }
}

class ProfileTextInput extends StatelessWidget {
  ProfileTextInput({
    Key key,
    @required this.label,
    this.contentStyle,
    this.maxLine = 1,
    this.rate = const [5, 5],
    this.saved,
    this.action,
    this.isValidator = false,
    this.isNumber = false,
    this.validatorMsg = '',
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
  final bool isNumber;
  final valueController;
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                          initialValue: value,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                            filled: true,
                            fillColor: AppColors.WHITE,
                            hintText: this.hint,
                            enabledBorder: new OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                borderSide:
                                    new BorderSide(color: AppColors.BLACK)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              borderSide:
                                  BorderSide(width: 1, color: AppColors.BLACK),
                            ),
                            // prefixIcon: Icon(
                            //   Icons.stacked_bar_chart,
                            //   color: AppColors.PRIMARY,
                            //   size: 30,
                            // )
                          ),
                          onChanged: (value) => {this.action(value)}),
                    ),
                  ],
                ))
          ]),
    );
  }
}
