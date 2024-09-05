import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class InputDialog extends StatelessWidget {
  const InputDialog(
      {@required this.value, this.hint, this.label, @required this.actions});
  final String value;
  final String hint;
  final String label;
  final Function actions;
  @override
  Widget build(BuildContext context) {
    TextEditingController valueController = TextEditingController(text: value);
    return Dialog(
      insetPadding: EdgeInsets.all(12),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Container(
        width: double.infinity,
        decoration: new BoxDecoration(
          color: AppColors.WHITE,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.PRIMARY,
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.notes_sharp,
                color: AppColors.POSITIVE_BUTTON_COLOR,
                size: 60,
              ),
              Text(
                label,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.PRIMARY, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                    controller: valueController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      filled: true,
                      fillColor: AppColors.WHITE,
                      hintText: hint,
                      enabledBorder: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          borderSide: new BorderSide(color: AppColors.PRIMARY)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        borderSide:
                            BorderSide(width: 1, color: AppColors.BLACK),
                      ),
                      // prefixIcon: Icon(
                      //   Icons.stacked_bar_chart,
                      //   color: AppColors.PRIMARY,
                      //   size: 30,
                      // )
                    ),
                    onChanged: (value) => {
                          // print(value);
                        }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    label: 'Save',
                    onPress: () => {
                      Navigator.of(context).pop(),
                      this.actions(valueController.text, 'yes')
                    },
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Button(
                      label: 'Cancel',
                      onPress: () => Navigator.of(context).pop(),
                      height: 40,
                      color: AppColors.RED),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
