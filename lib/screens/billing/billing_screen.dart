import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:childcaresoftware/widgets/simple_table_page.dart';
import 'package:childcaresoftware/widgets/widgets.dart';
import '../../widgets/widgets.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class BillingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(
          label: 'Billing',
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
                child: Align(
                  alignment: const Alignment(0, -1 / 3),
                  child: Form(
                    child: Column(
                      children: [
                        // _Header(),
                        Expanded(
                            child:
                                ListView(shrinkWrap: true, children: <Widget>[
                          _BillingDetailContainer(),
                          _CardInformationContainer(),
                          _PaymentHistoryContainer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: __PackageInformationContainer(),
                          ),
                        ]))
                      ],
                    ),
                  ),
                ),
                // );
                // }),
              ),
            )));
  }
}

class _BillingDetailContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
            decoration: new BoxDecoration(
                color: AppColors.PRIMARY,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.PRIMARY)),
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            'Billing Details',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.WHITE,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      // ),

                      GestureDetector(
                          child: Icon(Icons.add_circle,
                              size: 25, color: AppColors.WHITE),
                          onTap: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (_) => EducationDialog(
                            //           onSave: (education) {
                            //             context.bloc<ProfileBloc>().add(
                            //                 AddEducationEvent(
                            //                     education: education));
                            //           },
                            //         ));
                          })
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  // Account #	Created Date	Company Name	Primary User	Action
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('Please add your Billing Address'),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 40,
                          // width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.BLUE_BUTTON,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '+ New Billing',
                                style: TextStyle(
                                    color: AppColors.WHITE_COLOR,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // action();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}

class _CardInformationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
            decoration: new BoxDecoration(
                color: AppColors.PRIMARY,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.PRIMARY)),
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            'Card Information',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.WHITE,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      // ),

                      GestureDetector(
                          child: Icon(Icons.add_circle,
                              size: 25, color: AppColors.WHITE),
                          onTap: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (_) => EducationDialog(
                            //           onSave: (education) {
                            //             context.bloc<ProfileBloc>().add(
                            //                 AddEducationEvent(
                            //                     education: education));
                            //           },
                            //         ));
                          })
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  // Account #	Created Date	Company Name	Primary User	Action
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text('You have no cards'),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 40,
                          // width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.BLUE_BUTTON,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Add New Card',
                                style: TextStyle(
                                    color: AppColors.WHITE_COLOR,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // action();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}

class _PaymentHistoryContainer extends StatelessWidget {
  @override
  final columns = [
    "Status",
    "Billing Amount",
    "Currency",
    "Billing Frequency",
    "Action"
  ];
  final rows = 20;

  List<List<String>> makeData() {
    final List<List<String>> output = [];
    for (int i = 0; i < 20; i++) {
      final List<String> row = [];
      for (int j = 0; j < rows; j++) {
        row.add('L$j : T$i');
      }
      output.add(row);
    }
    return output;
  }

  /// Simple generator for row title
  List<String> makeTitleRow() => List.generate(rows, (i) => 'Left $i');
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
            decoration: new BoxDecoration(
                color: AppColors.PRIMARY,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.PRIMARY)),
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            'Payment History',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.WHITE,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                            child: Icon(Icons.add_circle,
                                size: 25, color: AppColors.WHITE),
                            onTap: () {
                              // showDialog(
                              //     context: context,
                              //     builder: (_) => EducationDialog(
                              //           onSave: (education) {
                              //             context.bloc<ProfileBloc>().add(
                              //                 AddEducationEvent(
                              //                     education: education));
                              //           },
                              //         ));
                            }),
                      ),
                      GestureDetector(
                          child: Icon(Icons.view_column_outlined,
                              size: 25, color: AppColors.WHITE),
                          onTap: () {
                            //   showDialog(
                            //       context: context,
                            //       builder: (_) => EducationDialog(
                            //             onSave: (education) {
                            //               context.bloc<ProfileBloc>().add(
                            //                   AddEducationEvent(
                            //                       education: education));
                            //             },
                            //           ));
                          })
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      color: AppColors.WHITE,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Container(
                        height: 200,
                        color: AppColors.RED,
                        child: SimpleTablePage(
                            width: 120,
                            height: 40,
                            titleColumn: columns,
                            titleRow: makeTitleRow(),
                            data: makeData(),
                            stickyLegend: "Date",
                            titleStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))
                        // height: MediaQuery.of(context).size.height,
                        )),
              ],
            ));
      },
    );
  }
}

class __PackageInformationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
            decoration: new BoxDecoration(
                color: AppColors.PRIMARY,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.PRIMARY)),
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            'Package Information',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.WHITE,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      // ),

                      GestureDetector(
                          child: Icon(Icons.add_circle,
                              size: 25, color: AppColors.WHITE),
                          onTap: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (_) => EducationDialog(
                            //           onSave: (education) {
                            //             context.bloc<ProfileBloc>().add(
                            //                 AddEducationEvent(
                            //                     education: education));
                            //           },
                            //         ));
                          })
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: AppColors.WHITE,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  // Account #	Created Date	Company Name	Primary User	Action
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                            'Thanks for giving us a try! You can keep using our system with a paid subscription. Subscribe now to keep using the tool.'),
                      ),
                      GestureDetector(
                        child: Container(
                          height: 40,
                          // width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.BLUE_BUTTON,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Add Package',
                                style: TextStyle(
                                    color: AppColors.WHITE_COLOR,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // action();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
