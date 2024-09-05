import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/widgets.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class WorkExperiencePopupState extends StatefulWidget {
  final Function(dynamic) action;
  final dynamic itemUpdate;

  const WorkExperiencePopupState({Key key, this.action, this.itemUpdate})
      : super(key: key);
  @override
  WorkExperiencePopup createState() => new WorkExperiencePopup();

  // Stateful Widgets are rarely more complicated than this.
}

class WorkExperiencePopup extends State<WorkExperiencePopupState> {
  bool isWorking;
  final format = DateFormat('MM/y');
  TextEditingController position = new TextEditingController();
  TextEditingController company = new TextEditingController();
  TextEditingController description = new TextEditingController();
  DateTime startDate;
  DateTime endDate;

  @override
  void initState() {
    super.initState();
    isWorking = widget.itemUpdate != null && widget.itemUpdate['current'] == 1
        ? true
        : false;
    position.text =
        widget.itemUpdate != null ? widget.itemUpdate['position'] : null;
    company.text =
        widget.itemUpdate != null ? widget.itemUpdate['company'] : null;
    description.text =
        widget.itemUpdate != null ? widget.itemUpdate['description'] : null;
    startDate = widget.itemUpdate != null
        ? DateFormat('MM/yyyy').parse(widget.itemUpdate['from'])
        : null;
    endDate = widget.itemUpdate != null
        ? DateFormat('MM/yyyy').parse(widget.itemUpdate['to'])
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          widget.itemUpdate != null
              ? 'Edit Work Experience'
              : 'Add Work Experience',
          style: TextStyle(color: AppColors.PRIMARY, fontSize: 20),
        ),
      ),
      content: Container(
        height: 300,
        // width: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: position,
                decoration: InputDecoration(labelText: 'Position'),
              ),
              TextFormField(
                controller: company,
                decoration: InputDecoration(labelText: 'Company'),
              ),
              Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: AppColors.GREY_COLOR,
                            size: 20.0,
                          ),
                          Text(
                            ' From (mm/yyyy)',
                            style: TextStyle(
                              color: AppColors.GREY_COLOR,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  // child: DateTimeField(
                  //   format: format,
                  //   initialValue: startDate,
                  //   resetIcon: null,
                  //   onChanged: (value) {
                  //     if (value == null) endDate = null;
                  //   },
                  //   onShowPicker: (context, currentValue) async {
                  //     final date = await showMonthPicker(
                  //         context: context,
                  //         firstDate: DateTime(1900),
                  //         initialDate: currentValue ?? DateTime.now(),
                  //         lastDate: DateTime(2100));
                  //     if (date != null && date.isBefore(DateTime.now())) {
                  //       startDate = date;
                  //       return date;
                  //     } else if (date != null &&
                  //         !date.isBefore(DateTime.now())) {
                  //       Dialogs.showErrorDialog(context,
                  //           'Please select a month before the current month');
                  //     }
                  //   },
                  // ),
                ),
              ]),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: AppColors.GREY_COLOR,
                          size: 20.0,
                        ),
                        Text(
                          ' To (mm/yyyy)',
                          style: TextStyle(
                            color: AppColors.GREY_COLOR,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                      // child: !isWorking
                      //     ? DateTimeField(
                      //         // enabled: !isWorking,
                      //         resetIcon: null,
                      //         format: format,
                      //         initialValue: endDate,
                      //         onChanged: (value) {
                      //           if (value == null) endDate = null;
                      //         },
                      //         onShowPicker: (context, currentValue) async {
                      //           final date = await showMonthPicker(
                      //               context: context,
                      //               firstDate: DateTime(1900),
                      //               initialDate: currentValue ?? DateTime.now(),
                      //               lastDate: DateTime(2100));
                      //           if (date != null) {
                      //             if (date.isBefore(DateTime.now()) &&
                      //                 (startDate != null &&
                      //                     date.isAfter(startDate
                      //                         .subtract(Duration(days: 1))))) {
                      //               endDate = date;
                      //               return date;
                      //             } else {
                      //               Dialogs.showErrorDialog(context,
                      //                   'Please select start date before and end date after start date');
                      //             }
                      //           }
                      //         },
                      //       )
                      //     : TextFormField(
                      //         readOnly: true,
                      //         controller:
                      //             new TextEditingController(text: 'Current'),
                      //         // decoration: InputDecoration(labelText: 'Current'),
                      //       ),
                    ),
                  ])),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                leading: Transform.translate(
                  offset: Offset(-2.0, 0.0),
                  child: Icon(
                    isWorking ? Icons.check_box : Icons.check_box_outline_blank,
                    color: AppColors.PRIMARY,
                  ),
                ),
                title: Text("I currently work here",
                    style:
                        TextStyle(color: AppColors.GREY_COLOR, fontSize: 16)),
                onTap: () {
                  endDate = DateTime.now();
                  setState(() {
                    isWorking = !isWorking;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20),
                  child: TextFormField(
                    controller: description,
                    decoration:
                        InputDecoration(labelText: 'Description (Optional)'),
                    maxLines: 2,
                  )),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Button(
                  label: widget.itemUpdate != null ? 'Save' : 'Add',
                  onPress: () {
                    if (position.text.isEmpty ||
                        company.text.isEmpty ||
                        startDate == null ||
                        (isWorking == false && endDate == null)) {
                      Dialogs.showErrorDialog(
                          context, 'Please complete all the fields');
                    } else if (startDate.isAfter(endDate)) {
                      Dialogs.showErrorDialog(context,
                          'Please select start date before and end date after start date');
                    } else {
                      widget.action({
                        'position': position.text,
                        'company': company.text,
                        'description': description.text,
                        'current': isWorking,
                        'startDate':
                            DateFormat('MM/yyyy').format(startDate).toString(),
                        'endDate':
                            DateFormat('MM/yyyy').format(endDate).toString()
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  height: 40,
                ),
              ),
              Container(
                child: Button(
                  label: 'Cancel',
                  onPress: () => Navigator.of(context).pop(),
                  height: 40,
                  color: AppColors.RED,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
