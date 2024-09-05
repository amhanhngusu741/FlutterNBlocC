import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/widgets/affiliation_dialog.dart';
import 'package:childcaresoftware/widgets/update_dialog.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class Dialogs {
  static showErrorDialog(context, message) {
    showDialog(
      context: context,
      builder: (_) => ErrorDialog(message: message),
    );
  }

  static showLoadingDialog(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => LoadingDialog(),
    );
  }

  static hideDialog(context) {
    // Navigator.pop(context);
    Navigator.of(context, rootNavigator: true).pop();
  }

  static showConfirmDialog(context, message, Function actions) {
    showDialog(
      context: context,
      builder: (_) => ConfirmDialog(message: message, actions: actions),
    );
  }

  static showConfirmSaveDialog(context, message, Function actions) {
    showDialog(
      context: context,
      builder: (_) => ConfirmSaveDialog(message: message, actions: actions),
    );
  }

  static showAlertDialog(context, message, Function onOkPress) {
    showDialog(
      context: context,
      builder: (_) => AlertsDialog(
        message: message,
        onOkPress: onOkPress,
      ),
    );
  }

  static showAppliedDialog(context, Function actions) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AppliedDialog(actions: actions),
    );
  }

  //Show Dialog to force user to update
  static showVersionDialog(context) async {
    showDialog(
      context: context,
      builder: (_) => UpdateDialog(),
    );
  }

  static showInputDialog(context, value, hint, label, Function onOkPress) {
    showDialog(
      context: context,
      builder: (_) => InputDialog(
        value: value,
        hint: hint,
        label: label,
        actions: onOkPress,
      ),
    );
  }
}
