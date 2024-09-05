import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';

class ButtonInput extends StatelessWidget {
  const ButtonInput(
      {Key key,
      this.action,
      this.title,
      this.icon,
      this.backgroundColor = AppColors.GREEN_BUTTON,
      this.color = AppColors.WHITE,
      this.radius = 5,
      this.height = 40,
      this.width,
      this.borderColor})
      : super(key: key);
  final Function action;
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color color;
  final double radius;
  final double height;
  final double width;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.radius),
          border: borderColor != null
              ? Border.all(
                  color: this.borderColor,
                  width: 1,
                )
              : null,
          color: this.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  this.icon != null
                      ? Icon(
                          this.icon,
                          size: 16,
                          color: this.color,
                        )
                      : Text(''),
                  this.title != ''
                      ? SizedBox(
                          width: 5,
                        )
                      : Container(),
                  Text(
                    this.title,
                    style: TextStyle(
                        color: color,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        action();
      },
    );
  }
}

class ButtonSortGroup extends StatelessWidget {
  const ButtonSortGroup({
    Key key,
    this.action,
    this.title,
    this.isShowIcon = true,
    this.backgroundColor = AppColors.GREEN_BUTTON,
    this.color = AppColors.WHITE,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    this.height = 40,
    this.width,
    this.borderColor,
    this.borderTop = 0,
    this.borderLeft = 0,
    this.borderRight = 0,
    this.borderBottom = 0,
    this.isSortASC = true,
    this.isSortDESC = true,
  }) : super(key: key);
  final Function action;
  final String title;
  final bool isShowIcon;
  final bool isSortASC;
  final bool isSortDESC;
  final Color backgroundColor;
  final Color color;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double height;
  final double width;
  final Color borderColor;
  final double borderTop;
  final double borderLeft;
  final double borderRight;
  final double borderBottom;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(topLeftRadius),
          //     topRight: Radius.circular(topRightRadius),
          //     bottomLeft: Radius.circular(bottomLeftRadius),
          //     bottomRight: Radius.circular(bottomRightRadius)),
          border: Border(
            left: borderLeft != 0
                ? BorderSide(
                    color: borderColor,
                    width: borderLeft,
                  )
                : BorderSide.none,
            top: borderTop != 0
                ? BorderSide(
                    color: borderColor,
                    width: borderTop,
                  )
                : BorderSide.none,
            right: borderRight != 0
                ? BorderSide(
                    color: borderColor,
                    width: borderRight,
                  )
                : BorderSide.none,
            bottom: borderBottom != 0
                ? BorderSide(
                    color: borderColor,
                    width: borderBottom,
                  )
                : BorderSide.none,
          ),
          color: this.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    this.title,
                    style: TextStyle(
                        color: color,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  this.isShowIcon
                      ? Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 16,
                              color: isSortASC
                                  ? AppColors.WHITE
                                  : AppColors.GREEN_BUTTON,
                            ),
                            Icon(
                              Icons.arrow_downward,
                              size: 16,
                              color: isSortDESC
                                  ? AppColors.WHITE
                                  : AppColors.GREEN_BUTTON,
                            )
                          ],
                        )
                      : Text(''),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        action();
      },
    );
  }
}
