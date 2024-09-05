import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/widgets/simple_table_page.dart';
import 'package:childcaresoftware/widgets/widgets.dart';
import '../../widgets/dropdown_label.dart';
import '../../widgets/widgets.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class ActivityScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(
          label: 'Activity',
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownLable(
                            label: "",
                            rate: [0, 10],
                            value: "All Activities",
                            valueList: [
                              "All Activities",
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DropdownLable(
                            label: "",
                            rate: [0, 10],
                            value: "All Children",
                            valueList: [
                              "All Children",
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "No Activity to show",
                            style: TextStyle(
                                color: AppColors.GREY_COLOR, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // );
                // }),
              ),
            )));
  }
}
