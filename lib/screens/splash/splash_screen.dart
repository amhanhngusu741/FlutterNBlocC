import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: AppColors.WHITE),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/logo-v4.png',
                      height: 150,
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     Text('THE',
                  //         style: TextStyle(
                  //             color: AppColors.PRIMARY,
                  //             fontSize: 45,
                  //             fontWeight: FontWeight.bold)),
                  //     Text('STAFF',
                  //         style: TextStyle(
                  //             color: AppColors.PRIMARY,
                  //             fontSize: 45,
                  //             fontWeight: FontWeight.bold)),
                  //     Text('HOUND',
                  //         style: TextStyle(
                  //             color: AppColors.PRIMARY,
                  //             fontSize: 45,
                  //             fontWeight: FontWeight.bold)),
                  //   ],
                  // ),
                  SizedBox(height: 80),
                  Container(
                    child: LoadingBouncingGrid.square(
                      backgroundColor: AppColors.PRIMARY,
                      inverted: true,
                    ),
                  ),
                ],
              ),
            )));
  }
}
