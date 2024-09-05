import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:childcaresoftware/repositories/repositories.dart';
import 'package:childcaresoftware/service_locator.dart';

class StartScreenPopup extends StatefulWidget {
  final String startScreen;
  final Function(dynamic) action;
  const StartScreenPopup({Key key, this.action, this.startScreen})
      : super(key: key);
  @override
  StartScreenPopupState createState() => new StartScreenPopupState();
}

class StartScreenPopupState extends State<StartScreenPopup> {
  StartScreenMode startScreenMode;
  @override
  void initState() {
    super.initState();

    print(widget.startScreen);

    switch (widget.startScreen) {
      case '0':
        startScreenMode = StartScreenMode.schedule;
        break;
      case '1':
        startScreenMode = StartScreenMode.jobs;
        break;
      case '2':
        startScreenMode = StartScreenMode.alerts;
        break;
      default:
        startScreenMode = StartScreenMode.schedule;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Screen List',
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
                title: const Text('Schedule'),
                // subtitle: Text('Enable sound'),
                leading: Radio(
                  value: StartScreenMode.schedule,
                  groupValue: startScreenMode,
                  activeColor: AppColors.PRIMARY,
                  onChanged: (StartScreenMode value) {
                    setState(() {
                      startScreenMode = value;
                    });
                  },
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding: EdgeInsets.zero,
                title: const Text('Jobs'),
                // subtitle: Text('Disable sound'),
                leading: Radio(
                  value: StartScreenMode.jobs,
                  groupValue: startScreenMode,
                  activeColor: AppColors.PRIMARY,
                  onChanged: (StartScreenMode value) {
                    setState(() {
                      startScreenMode = value;
                    });
                  },
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                contentPadding: EdgeInsets.zero,
                title: const Text('Alerts'),
                // subtitle: Text('Disable sound'),
                leading: Radio(
                  value: StartScreenMode.alerts,
                  groupValue: startScreenMode,
                  activeColor: AppColors.PRIMARY,
                  onChanged: (StartScreenMode value) {
                    setState(() {
                      startScreenMode = value;
                    });
                  },
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
                    String indexScreen;
                    if (startScreenMode == StartScreenMode.schedule) {
                      indexScreen = '0';
                    } else if (startScreenMode == StartScreenMode.jobs) {
                      indexScreen = '1';
                    } else if (startScreenMode == StartScreenMode.alerts) {
                      indexScreen = '2';
                    }
                    widget.action({
                      'startScreen': indexScreen,
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
