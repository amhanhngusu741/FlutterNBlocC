import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required this.label,
    @required this.onPress,
    this.width,
    this.height = 48,
    this.color = AppColors.PRIMARY,
    this.textStyle =
        const TextStyle(color: AppColors.WHITE, fontWeight: FontWeight.bold),
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(const Radius.circular(18)),
    ),
    this.flex = 0,
    this.prefix,
  }) : super(key: key);

  final String label;
  final VoidCallback onPress;
  final double width;
  final double height;
  final Color color;
  final TextStyle textStyle;
  final ShapeBorder shape;
  final int flex;
  final Widget prefix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: flex,
            child: SizedBox(
              width: width,
              height: height,
              child: RaisedButton(
                shape: shape,
                onPressed: onPress,
                color: color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prefix ?? Container(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: Text(
                        this.label,
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
