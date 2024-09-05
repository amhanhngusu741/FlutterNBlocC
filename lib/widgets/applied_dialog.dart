import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class AppliedDialog extends StatelessWidget {
  const AppliedDialog({@required this.actions});

  final Function actions;
  @override
  Widget build(BuildContext context) {
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
                height: 20,
              ),
              Text(
                'Job Application Sent',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.PRIMARY, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.check_circle,
                color: AppColors.PRIMARY_SECOND,
                size: 60,
              ),
              SizedBox(
                height: 20,
              ),
              // GestureDetector(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Text(
              //         'Return to Job Search',
              //         style: TextStyle(fontSize: 12),
              //       ),
              //       Icon(Icons.chevron_right),
              //     ],
              //   ),
              //   onTap: () => {Navigator.of(context).pop(), this.actions()},
              //   // Navigator.of(context, rootNavigator: true).pop();
              // )
              Button(
                label: 'Return to Job Lists',
                onPress: () => {Navigator.of(context).pop(), this.actions()},
                height: 40,
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Button(
              //       label: 'Yes',
              //       onPress: () => {this.actions()},
              //       width: 60,
              //       height: 40,
              //     ),
              //     SizedBox(
              //       width: 50,
              //     ),
              //     Button(
              //       label: 'No',
              //       onPress: () => Navigator.of(context).pop(),
              //       width: 60,
              //       height: 40,
              //       color: AppColors.RED,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
