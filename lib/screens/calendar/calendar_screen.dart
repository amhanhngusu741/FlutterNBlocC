import 'package:childcaresoftware/widgets/calendar_carousel.dart';
import 'package:childcaresoftware/widgets/dropdown_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_html/style.dart';
import 'package:package_info/package_info.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/router.dart';
import 'dart:async';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/form_status.dart';

// const List<String> _assetNames = <String>[
//   // 'assets/notfound.svg', // uncomment to test an asset that doesn't exist.
//   'assets/icon/icon1.svg',
//   'assets/icon/icon2.svg',
//   'assets/icon/icon3.svg',
// ];

// class CalendarScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TopBar(
//         label: 'Lesson Plan',
//         isShowBackButton: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//         child: _CalendarScreen(),
//       ),
//     );
//   }
// }

// class _CalendarScreen extends StatefulWidget {
//   const _CalendarScreen({
//     Key key,
//   }) : super(key: key);

//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }

// class _CalendarScreenState extends State<_CalendarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(left: 5, right: 5),
//           decoration: BoxDecoration(
//               border: Border.all(
//                 color: AppColors.LIGHT_GREY,
//               ),
//               borderRadius: BorderRadius.all(Radius.circular(3.0) //
//                   ),
//               color: AppColors.WHITE),
//           child: CalendarInput(
//             type: 1,
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 5, right: 5, top: 30, bottom: 30),
//           child: Text(
//             "Your provider hasn't shared a lesson plan for this weeek",
//             style: TextStyle(color: AppColors.GREY_COLOR, fontSize: 15),
//             textAlign: TextAlign.center,
//           ),
//         )
//       ],
//     );
//   }

//   Future getPackageInfo() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     return packageInfo;
//   }

//   void sendInfoToAnalytics(String email) {
//     // MyApp.observer.analytics.logEvent(
//     //   name: 'Log out Setting Screen',
//     //   parameters: <String, dynamic>{
//     //     'email': email,
//     //   },
//     // );
//   }
// }

class CalendarScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(
          label: 'Calendar',
          isShowBackButton: false,
        ),
        body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: BlocProvider(
              create: (context) {
                return ProfileBloc();
              },
              child: BlocListener<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    switch (state.status) {
                      case FormStatus.submissionInProgress:
                        Dialogs.showLoadingDialog(context);
                        break;
                      case FormStatus.submissionSuccess:
                        Dialogs.hideDialog(context);
                        // if (state.isUpdateSuccess) {
                        //   Dialogs.showAlertDialog(
                        //       context, state.messageStatus, () {});
                        // }
                        break;
                      case FormStatus.submissionFailure:
                        Dialogs.hideDialog(context);
                        Dialogs.showErrorDialog(context, state.messageStatus);
                        break;
                      default:
                    }
                  },
                  child: Center(
                    child: Text(
                      'This screen has no designed',
                      // textScaleFactor: 2,
                      style: TextStyle(
                          color: AppColors.DEEP_GREY,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  )
                  // );
                  // }),
                  ),
            )));
  }
}
