import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';

class DaysInWeek extends StatelessWidget {
  const DaysInWeek(this.daysInWeek);
  final List<dynamic> daysInWeek;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...[
          {'value': '0', 'text': 'Su'},
          {'value': '1', 'text': 'Mo'},
          {'value': '2', 'text': 'Tu'},
          {'value': '3', 'text': 'We'},
          {'value': '4', 'text': 'Th'},
          {'value': '5', 'text': 'Fr'},
          {'value': '6', 'text': 'Sa'},
        ].map((day) => Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: daysInWeek.indexOf(day['value']) != -1
                      ? AppColors.PRIMARY
                      : AppColors.WHITE, // button color
                  border: Border.all(width: 1.0, color: AppColors.PRIMARY),
                  borderRadius: BorderRadius.all(Radius.circular(
                          15.0) //                 <--- border radius here
                      ),
                ),
                child: Text(
                  day['text'],
                  style: TextStyle(
                    fontSize: 12,
                    color: daysInWeek.indexOf(day['value']) != -1
                        ? AppColors.WHITE
                        : AppColors.BLACK,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
