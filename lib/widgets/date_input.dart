import 'dart:ui';

// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:intl/intl.dart';
import 'package:childcaresoftware/constants/color.dart';

class DatePeriodInput extends StatelessWidget {
  DatePeriodInput({
    Key key,
    @required this.label,
    this.contentStyle,
    this.maxLine = 1,
    this.rate = const [5, 5],
    this.saved,
    this.action,
    this.isValidator = false,
  }) : super(key: key);

  final String label;
  final TextStyle contentStyle;
  final int maxLine;
  final List<int> rate;
  final Function saved;
  final Function action;
  final bool isValidator;
  final DateFormat format = DateFormat('MM/dd/y');
  @override
  Widget build(BuildContext context) {
    DateTime startDate;
    // DateTime endDate;
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
              child: Container(
                height: 50,
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
                //   initialValue: startDate,
                //   resetIcon: null,
                //   onChanged: (value) {
                //     print(value);
                //   },
                //   onShowPicker: (context, currentValue) async {
                //     final date = await showDatePicker(
                //         context: context,
                //         firstDate: DateTime(1900),
                //         initialDate: currentValue ?? DateTime.now(),
                //         lastDate: DateTime(2100));
                //     // if (date != null && date.isBefore(DateTime.now())) {
                //     //   startDate = date;
                //     // } else if (date != null && !date.isBefore(DateTime.now())) {
                //     //   Dialogs.showErrorDialog(context,
                //     //       'Please select a month before the current month');
                //     // }
                //     return date;
                //   },
                // ),
              ),
            )
          ]),
    );
  }
}
