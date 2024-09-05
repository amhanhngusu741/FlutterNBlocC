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

class TeacherScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(
          label: 'Teacher',
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
