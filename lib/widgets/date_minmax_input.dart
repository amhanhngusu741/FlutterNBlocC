import 'dart:ui';

// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:intl/intl.dart';
import 'package:childcaresoftware/constants/color.dart';

class DatePeriodMinMaxInput extends StatefulWidget {
  DatePeriodMinMaxInput({
    Key key,
    @required this.label,
    this.contentStyle,
    this.maxLine = 1,
    this.rate = const [5, 5],
    this.maxAction,
    this.minAction,
    this.isValidator = false,
    this.startDate,
    this.endDate,
  }) : super(key: key);

  final String label;
  final TextStyle contentStyle;
  final int maxLine;
  final List<int> rate;
  final Function minAction;
  final Function maxAction;
  final bool isValidator;
  final DateTime startDate;
  final DateTime endDate;

  @override
  _DatePeriodMinMaxInputState createState() => _DatePeriodMinMaxInputState();
}

class _DatePeriodMinMaxInputState extends State<DatePeriodMinMaxInput> {
  final DateFormat format = DateFormat('MM/dd/y');
  DateTime startDate;
  DateTime endDate;
  @override
  void initState() {
    super.initState();
    startDate = new DateTime.now();
    endDate = new DateTime.now();
  }

  // if (widget.minValue.toString() != minController.text) {
  //   this.setState(() {
  //     minController.text = widget.minValue.toString();
  //   });
  // }
  // if (widget.maxValue.toString() != maxController.text) {
  //   this.setState(() {
  //     maxController.text = widget.minValue.toString();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // print('Date fhjdhgfdjhgsj');
    // print(widget.startDate);
    // print(startDate);
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
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 9,
                    // child: DateTimeField(
                    //   decoration: InputDecoration(
                    //       enabledBorder: const OutlineInputBorder(
                    //         // width: 0.0 produces a thin "hairline" border
                    //         borderSide: const BorderSide(
                    //             color: AppColors.BLACK, width: 1.0),
                    //       ),
                    //       border: const OutlineInputBorder(),
                    //       contentPadding: EdgeInsets.only(
                    //           left: 10, bottom: 11, top: 11, right: 15),
                    //       hintText: "Select a date"),
                    //   format: format,
                    //   initialValue: widget.startDate,
                    //   resetIcon: null,
                    //   onChanged: (value) {
                    //     this.widget.minAction(value);
                    //   },
                    //   onShowPicker: (context, currentValue) async {
                    //     final date = await showDatePicker(
                    //         context: context,
                    //         firstDate: DateTime(1900),
                    //         initialDate: currentValue ?? DateTime.now(),
                    //         lastDate: DateTime(2100));
                    //     if (widget.endDate != null &&
                    //         widget.endDate.isBefore(
                    //             DateTime(date.year, date.month, date.day))) {
                    //       Dialogs.showErrorDialog(
                    //           context, 'Please select a date before end date');
                    //       return null;
                    //     } else {
                    //       return date;
                    //     }
                    //   },
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 8,
                    // child: DateTimeField(
                    //   enabled: this.widget.startDate == null ? false : true,
                    //   decoration: InputDecoration(
                    //       enabledBorder: const OutlineInputBorder(
                    //         // width: 0.0 produces a thin "hairline" border
                    //         borderSide: const BorderSide(
                    //             color: AppColors.BLACK, width: 1.0),
                    //       ),
                    //       border: const OutlineInputBorder(),
                    //       contentPadding: EdgeInsets.only(
                    //           left: 10, bottom: 11, top: 11, right: 15),
                    //       hintText: "Select a date"),
                    //   format: format,
                    //   initialValue: widget.startDate,
                    //   resetIcon: null,
                    //   onChanged: (value) {
                    //     this.widget.maxAction(value);
                    //   },
                    //   onShowPicker: (context, currentValue) async {
                    //     final date = await showDatePicker(
                    //         context: context,
                    //         firstDate: DateTime(1900),
                    //         initialDate: currentValue ?? DateTime.now(),
                    //         lastDate: DateTime(2100));
                    //     if (widget.startDate != null &&
                    //         !widget.startDate.isBefore(DateTime(
                    //             date.year, date.month, date.day + 1))) {
                    //       Dialogs.showErrorDialog(
                    //           context, 'Please select a date after start date');
                    //       return null;
                    //     } else {
                    //       return date;
                    //     }
                    //   },
                    // ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
