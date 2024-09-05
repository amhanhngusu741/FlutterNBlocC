// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class EducationDialog extends StatefulWidget {
  final Function(dynamic) onSave;
  final dynamic item;

  const EducationDialog({Key key, this.onSave, this.item}) : super(key: key);

  @override
  _EducationDialogState createState() => _EducationDialogState();
}

class _EducationDialogState extends State<EducationDialog> {
  bool isAttending;
  final format = DateFormat('MM/y');
  TextEditingController school = new TextEditingController();
  TextEditingController degree = new TextEditingController();
  TextEditingController major = new TextEditingController();
  DateTime startDate;
  DateTime endDate;
  TextEditingController description = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isAttending =
        widget.item != null && widget.item['current'] == 1 ? true : false;
    school.text = widget.item != null ? widget.item['school'] : null;
    degree.text = widget.item != null ? widget.item['degree'] : null;
    major.text = widget.item != null ? widget.item['major'] : null;
    startDate = widget.item != null
        ? DateFormat('MM/yyyy').parse(widget.item['from'])
        : null;
    endDate = widget.item != null
        ? DateFormat('MM/yyyy').parse(widget.item['to'])
        : null;
    description.text = widget.item != null ? widget.item['description'] : null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          widget.item != null ? 'Edit Education' : 'Add Education',
          style: TextStyle(color: AppColors.PRIMARY, fontSize: 20),
        ),
      ),
      content: Container(
        // height: 00,
        // width: 300,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: school,
                  decoration: InputDecoration(labelText: 'School Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: degree,
                  decoration: InputDecoration(labelText: 'Degree'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: major,
                  decoration:
                      InputDecoration(labelText: 'Major or filed of study'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                ListTile(
                  dense: true,
                  // visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                  contentPadding: EdgeInsets.all(0),
                  leading: Transform.translate(
                    offset: Offset(-2.0, 0.0),
                    child: Icon(
                      isAttending
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: AppColors.PRIMARY,
                    ),
                  ),
                  title: Transform.translate(
                    offset: Offset(-20.0, 0.0),
                    child: Text("Currently Attending",
                        style: TextStyle(
                            color: AppColors.GREY_COLOR, fontSize: 16)),
                  ),
                  onTap: () {
                    endDate = DateTime.now();
                    setState(() {
                      isAttending = !isAttending;
                    });
                  },
                ),
                Container(
                    // child: DateTimeField(
                    //   format: format,
                    //   initialValue: startDate,
                    //   decoration: InputDecoration(
                    //     labelText: 'From (mm/yyyy)',
                    //   ),
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
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'This field is required';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    ),
                // Container(
                //   child: !isAttending
                //       ? DateTimeField(
                //           enabled: !isAttending,
                //           format: format,
                //           initialValue: endDate,
                //           decoration: InputDecoration(
                //             labelText: 'To (mm/yyyy)',
                //           ),
                //           validator: (value) {
                //             if (value == null && isAttending == false) {
                //               return 'This field is required';
                //             }
                //             return null;
                //           },
                //           onChanged: (value) {
                //             if (value == null) endDate = null;
                //           },
                //           onShowPicker: (context, currentValue) async {
                //             final date = await showMonthPicker(
                //                 context: context,
                //                 firstDate: DateTime(1900),
                //                 initialDate: currentValue ?? DateTime.now(),
                //                 lastDate: DateTime(2100));
                //             if (date != null) {
                //               if (date.isBefore(DateTime.now()) &&
                //                   (startDate != null &&
                //                       date.isAfter(startDate
                //                           .subtract(Duration(days: 1))))) {
                //                 endDate = date;
                //                 return date;
                //               } else {
                //                 Dialogs.showErrorDialog(context,
                //                     'Please select start date before and end date after start date');
                //               }
                //             }
                //           },
                //         )
                //       : TextFormField(
                //           readOnly: true,
                //           controller:
                //               new TextEditingController(text: 'Current'),
                //           // decoration: InputDecoration(labelText: 'Current'),
                //         ),
                // ),
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
      ),
      actions: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Button(
                  width: 90,
                  label: widget.item != null ? 'Save' : 'Add',
                  height: 40,
                  onPress: () {
                    if (_formKey.currentState.validate()) {
                      if (startDate.isAfter(endDate)) {
                        Dialogs.showErrorDialog(context,
                            'Please select start date before and end date after start date');
                      } else {
                        widget.onSave({
                          'school': school.text,
                          'degree': degree.text,
                          'major': major.text,
                          'current': isAttending,
                          'from': DateFormat('MM/yyyy')
                              .format(startDate)
                              .toString(),
                          'to':
                              DateFormat('MM/yyyy').format(endDate).toString(),
                          'description': description.text,
                        });
                        Navigator.of(context).pop();
                      }
                    }
                  },
                ),
              ),
              Container(
                child: Button(
                  width: 90,
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
