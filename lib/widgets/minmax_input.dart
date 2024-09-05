import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/multi_select.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class MinMaxInput extends StatefulWidget {
  MinMaxInput(
      {Key key,
      @required this.label,
      this.contentStyle,
      this.maxLine = 1,
      this.rate = const [5, 5],
      this.saved,
      this.minAction,
      this.maxAction,
      this.isValidator = false,
      this.isNumber = false,
      this.validatorMsg = '',
      this.value = '',
      this.maxLength = 0,
      this.minValue = 0,
      this.maxValue = 0})
      : super(key: key);

  final String label;
  final String value;
  final TextStyle contentStyle;
  final int maxLine;
  final List<int> rate;
  final Function saved;
  final Function(dynamic) minAction;
  final Function(dynamic) maxAction;
  final bool isValidator;
  final String validatorMsg;
  final bool isNumber;
  final int maxLength;
  final int minValue;
  final int maxValue;

  @override
  _MinMaxInputState createState() => _MinMaxInputState();
}

class _MinMaxInputState extends State<MinMaxInput> {
  TextEditingController minController = new TextEditingController();
  TextEditingController maxController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    minController.text = widget.minValue.toString();
    maxController.text = widget.maxValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.minValue.toString() != minController.text) {
      this.setState(() {
        minController.text = widget.minValue.toString();
      });
    }
    if (widget.maxValue.toString() != maxController.text) {
      this.setState(() {
        maxController.text = widget.minValue.toString();
      });
    }
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: widget.rate[0],
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.label,
                      style: widget.contentStyle,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: widget.rate[1],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: NumberInputWithIncrementDecrement(
                        numberFieldDecoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Min"),
                        widgetContainerDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(
                            color: AppColors.BLACK,
                            width: 1.0,
                          ),
                          color: Colors.white,
                        ),
                        controller: minController,
                        min: 0,
                        // max: 3,

                        initialValue: widget.minValue,
                        onIncrement: (value) {
                          this.widget.minAction(value);
                        },
                        onDecrement: (value) {
                          this.widget.minAction(value);
                        },
                        onChanged: (value) {
                          this.widget.minAction(value);
                        },
                        separateIcons: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: NumberInputWithIncrementDecrement(
                        numberFieldDecoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Max"),
                        widgetContainerDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(
                            color: AppColors.BLACK,
                            width: 1.0,
                          ),
                          color: Colors.white,
                        ),
                        controller: maxController,
                        min: 0,
                        // max: 3,
                        initialValue: this.widget.maxValue,
                        onIncrement: (value) {
                          this.widget.maxAction(value);
                        },
                        onDecrement: (value) {
                          this.widget.maxAction(value);
                        },
                        onChanged: (value) {
                          this.widget.maxAction(value);
                        },
                        separateIcons: false,
                      ),
                    ),
                  ],
                ))
          ]),
    );
  }
}

class MinMaxInputWithDropdown extends StatefulWidget {
  MinMaxInputWithDropdown({
    Key key,
    @required this.label,
    this.contentStyle,
    this.maxLine = 1,
    this.rate = const [5, 5],
    this.saved,
    this.minAction,
    this.maxAction,
    this.isValidator = false,
    this.isNumber = false,
    this.validatorMsg = '',
    this.value = '',
    this.maxLength = 0,
    this.minValue = 0,
    this.maxValue = 0,
    this.dropdownAction,
    this.itemList,
    this.isSelectAll = true,
    @required this.initItem,
  }) : super(key: key);

  final String label;
  final String value;
  final TextStyle contentStyle;
  final int maxLine;
  final List<int> rate;
  final Function saved;
  final Function(dynamic) minAction;
  final Function(dynamic) maxAction;
  final bool isValidator;
  final String validatorMsg;
  final bool isNumber;
  final int maxLength;
  final int minValue;
  final int maxValue;
  final List<dynamic> initItem;
  final Function(dynamic) dropdownAction;
  final List<dynamic> itemList;
  final bool isSelectAll;
  @override
  _MinMaxInputWithDropdownState createState() =>
      _MinMaxInputWithDropdownState();
}

class _MinMaxInputWithDropdownState extends State<MinMaxInputWithDropdown> {
  TextEditingController minController = new TextEditingController();
  TextEditingController maxController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    minController.text = widget.minValue.toString();
    maxController.text = widget.maxValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.minValue.toString() != minController.text) {
      this.setState(() {
        minController.text = widget.minValue.toString();
      });
    }
    if (widget.maxValue.toString() != maxController.text) {
      this.setState(() {
        maxController.text = widget.minValue.toString();
      });
    }
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: widget.rate[0],
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.label,
                      style: widget.contentStyle,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: widget.rate[1],
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.BLACK),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            height: 50,
                            child: MultiSelectCustom(
                              isSelectAll: widget.isSelectAll,
                              filterable: false,
                              value: widget.initItem,
                              titleText: widget.label,
                              titleTextColor: AppColors.BLACK,
                              isShowSelectedOptions: false,
                              autovalidate: false,
                              dataSource: widget.itemList,
                              textField: 'name',
                              valueField: 'id',
                              onSaved: (value) {
                                widget.dropdownAction(value);
                              },
                              selectIcon: Icons.arrow_drop_down_circle,
                              open: () {
                                print('The value is open');
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: NumberInputWithIncrementDecrement(
                            numberFieldDecoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Min"),
                            widgetContainerDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(
                                color: AppColors.BLACK,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            controller: minController,
                            min: 0,
                            // max: 3,

                            initialValue: widget.minValue,
                            onIncrement: (value) {
                              this.widget.minAction(value);
                            },
                            onDecrement: (value) {
                              this.widget.minAction(value);
                            },
                            onChanged: (value) {
                              this.widget.minAction(value);
                            },
                            separateIcons: false,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: NumberInputWithIncrementDecrement(
                            numberFieldDecoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Max"),
                            widgetContainerDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(
                                color: AppColors.BLACK,
                                width: 1.0,
                              ),
                              color: Colors.white,
                            ),
                            controller: maxController,
                            min: 0,
                            // max: 3,
                            initialValue: this.widget.maxValue,
                            onIncrement: (value) {
                              this.widget.maxAction(value);
                            },
                            onDecrement: (value) {
                              this.widget.maxAction(value);
                            },
                            onChanged: (value) {
                              this.widget.maxAction(value);
                            },
                            separateIcons: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ]),
    );
  }
}

class DropdownSelectInput extends StatefulWidget {
  DropdownSelectInput({
    Key key,
    @required this.label,
    this.contentStyle,
    this.maxLine = 1,
    this.rate = const [5, 5],
    this.saved,
    this.isValidator = false,
    this.isNumber = false,
    this.validatorMsg = '',
    this.value = '',
    this.maxLength = 0,
    this.action,
    this.itemList,
    this.isSelectAll = true,
    @required this.initItem,
  }) : super(key: key);

  final String label;
  final String value;
  final TextStyle contentStyle;
  final int maxLine;
  final List<int> rate;
  final Function saved;
  final bool isValidator;
  final String validatorMsg;
  final bool isNumber;
  final int maxLength;
  final List<dynamic> initItem;
  final Function(dynamic) action;
  final List<dynamic> itemList;
  final bool isSelectAll;
  @override
  _DropdownSelectInputState createState() => _DropdownSelectInputState();
}

class _DropdownSelectInputState extends State<DropdownSelectInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: widget.rate[0],
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.label,
                      style: widget.contentStyle,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: widget.rate[1],
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.BLACK),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            height: 50,
                            child: MultiSelectCustom(
                              isSelectAll: widget.isSelectAll,
                              filterable: false,
                              value: widget.initItem,
                              titleText: widget.label,
                              titleTextColor: AppColors.BLACK,
                              isShowSelectedOptions: false,
                              autovalidate: false,
                              dataSource: widget.itemList,
                              textField: 'name',
                              valueField: 'id',
                              onSaved: (value) {
                                widget.action(value);
                              },
                              selectIcon: Icons.arrow_drop_down_circle,
                              open: () {
                                print('The value is open');
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ))
          ]),
    );
  }
}
