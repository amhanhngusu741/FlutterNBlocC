import 'package:childcaresoftware/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import '../commons/variables.dart';
import '../screens/payment/payment_router.dart';
import '../screens/settings/settings_router.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    Key key,
    this.label,
    this.onPress,
    this.isBadge = false,
    this.badge,
    this.action,
    this.isShowSetting = true,
    this.isShowBackButton = true,
    this.icon = Icons.tune_outlined,
  }) : super(key: key);

  final String label;
  final VoidCallback onPress;
  final bool isBadge;
  final int badge;
  final Function action;
  final bool isShowSetting;
  final bool isShowBackButton;
  final IconData icon;
  _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: isShowBackButton
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.WHITE,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : SizedBox(width: 50),
        iconTheme: IconThemeData(
          color: AppColors.WHITE, //change your color here
        ),
        backgroundColor: AppColors.PRIMARY,
        title: Center(
          child: Text(
            this.label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.WHITE,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.WHITE, size: 20),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          // Navigator.of(context).pushNamedIfNotCurrent('/NewRoute');
          Variables.isTeacher
              ? IconButton(
                  icon: Icon(Icons.tune_outlined,
                      color: AppColors.WHITE, size: 20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  },
                )
              : IconButton(
                  icon: Icon(Icons.payment_outlined,
                      color: AppColors.WHITE, size: 20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()),
                    );
                  },
                ),
        ]);
  }
}

class TopBarWithAction extends StatelessWidget implements PreferredSizeWidget {
  const TopBarWithAction({
    Key key,
    this.label,
    this.onPress,
    this.isBadge = false,
    this.badge,
    this.action,
    this.isRedirect = true,
  }) : super(key: key);

  final String label;
  final VoidCallback onPress;
  final bool isBadge;
  final int badge;
  final Function action;
  final bool isRedirect;

  @override
  Size get preferredSize => Size.fromHeight(50);
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.WHITE, //change your color here
        ),
        backgroundColor: AppColors.PRIMARY,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              this.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.WHITE,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check, color: AppColors.WHITE, size: 30),
            onPressed: () {
              action();
            },
          ),
        ]);
  }
}
