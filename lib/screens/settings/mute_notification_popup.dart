import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/widgets/widgets.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class MuteNotificationPopup extends StatefulWidget {
  final Function(dynamic) action;
  final dynamic dateFilter;
  final SettingNotify settings;

  const MuteNotificationPopup(
      {Key key, this.action, this.dateFilter, this.settings})
      : super(key: key);
  @override
  MuteNotificationPopupState createState() => new MuteNotificationPopupState();
}

class MuteNotificationPopupState extends State<MuteNotificationPopup> {
  final format = DateFormat('MM/dd/y');
  DateTime fromDate;
  DateTime toDate;
  SoundMode soundMode;

  @override
  void initState() {
    super.initState();
    soundMode = widget.settings.soundMode;
    DateTime now = new DateTime.now();
    // fromDate = widget.settings.muteFrom != null
    //     ? DateFormat('MM/dd/yyyy').parse(widget.settings.muteFrom)
    //     : DateTime(now.year, now.month, now.day);
    // toDate = widget.settings.muteTo != null
    //     ? DateFormat('MM/dd/yyyy').parse(widget.settings.muteTo)
    //     : DateTime(now.year, now.month, now.day).add(Duration(days: 7));
    fromDate = DateTime(now.year, now.month, now.day);
    toDate = DateTime(now.year, now.month, now.day).add(Duration(days: 7));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Notification',
          style: TextStyle(color: AppColors.PRIMARY, fontSize: 20),
        ),
      ),
      content: Container(
        // height: 120,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding: EdgeInsets.zero,
                title: const Text('On'),
                subtitle: Text('Enable sound'),
                leading: Radio(
                  value: SoundMode.always,
                  groupValue: soundMode,
                  activeColor: AppColors.PRIMARY,
                  onChanged: (SoundMode value) {
                    setState(() {
                      soundMode = value;
                    });
                  },
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding: EdgeInsets.zero,
                title: const Text('Off'),
                subtitle: Text('Disable sound'),
                leading: Radio(
                  value: SoundMode.off,
                  groupValue: soundMode,
                  activeColor: AppColors.PRIMARY,
                  onChanged: (SoundMode value) {
                    setState(() {
                      soundMode = value;
                    });
                  },
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding: EdgeInsets.zero,
                title: const Text('Off for period of time'),
                subtitle: Text('Choose period (Max 7 days)'),
                leading: Radio(
                  value: SoundMode.custom,
                  activeColor: AppColors.PRIMARY,
                  groupValue: soundMode,
                  onChanged: (SoundMode value) {
                    setState(() {
                      soundMode = value;
                    });
                  },
                ),
              ),
              Offstage(
                offstage: soundMode != SoundMode.custom,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'From',
                            style: TextStyle(
                                color: AppColors.GREY_COLOR, fontSize: 14),
                          ),
                          Expanded(
                              // child: DateTimeField(
                              //     format: format,
                              //     initialValue: fromDate,
                              //     textAlign: TextAlign.right,
                              //     decoration: InputDecoration(
                              //       border: InputBorder.none,
                              //     ),
                              //     style: TextStyle(
                              //         fontSize: 14,
                              //         color: AppColors.PRIMARY,
                              //         fontWeight: FontWeight.bold),
                              //     resetIcon: null,
                              //     onShowPicker: (context, currentValue) async {
                              //       final date = await showDatePicker(
                              //           context: context,
                              //           firstDate: DateTime.now(),
                              //           initialDate:
                              //               currentValue ?? DateTime.now(),
                              //           lastDate: DateTime(2050));
                              //       fromDate = date;
                              //       return date;
                              //     },
                              //     onChanged: (context) {
                              //       fromDate = context;
                              //     }),
                              ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Row(children: <Widget>[
                        Text(
                          'To',
                          style: TextStyle(
                              color: AppColors.GREY_COLOR, fontSize: 14),
                        ),
                        Expanded(
                            // child: DateTimeField(
                            //   textAlign: TextAlign.right,
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //   ),
                            //   style: TextStyle(
                            //       fontSize: 14,
                            //       color: AppColors.PRIMARY,
                            //       fontWeight: FontWeight.bold),
                            //   resetIcon: null,
                            //   format: format,
                            //   initialValue: toDate,
                            //   onShowPicker: (context, currentValue) async {
                            //     final date = await showDatePicker(
                            //         context: context,
                            //         firstDate: DateTime.now(),
                            //         initialDate: currentValue ?? DateTime.now(),
                            //         lastDate: DateTime(2050));
                            //     toDate = date;
                            //     return date;
                            //   },
                            //   onChanged: (context) {
                            //     toDate = context;
                            //   },
                            // ),
                            ),
                      ]),
                    ],
                  ),
                ),
              ),
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
                  label: 'OK',
                  onPress: () {
                    if (soundMode == SoundMode.custom) {
                      if (!toDate
                          .isAfter(fromDate.subtract(Duration(days: 1)))) {
                        Dialogs.showErrorDialog(context,
                            'Please select start date before end date');
                        return;
                      } else if (toDate.difference(fromDate).inDays > 7) {
                        Dialogs.showErrorDialog(
                            context, 'Please choose period max 7 days');
                        return;
                      }
                    }
                    String fromStr = '';
                    String toStr = '';
                    if (fromDate != null)
                      fromStr =
                          DateFormat('MM/dd/yyyy').format(fromDate).toString();
                    if (toDate != null)
                      toStr =
                          DateFormat('MM/dd/yyyy').format(toDate).toString();
                    widget.action({
                      'soundMode': soundMode,
                      'fromDate': fromStr,
                      'toDate': toStr
                    });
                    Navigator.of(context).pop();
                  },
                  width: 100,
                  height: 40,
                ),
              ),
              Container(
                child: Button(
                  label: 'Cancel',
                  onPress: () => Navigator.of(context).pop(),
                  width: 100,
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
