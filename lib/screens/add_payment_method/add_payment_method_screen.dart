import 'package:childcaresoftware/screens/student/student_tab.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';
import 'add_payment_method_widget.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Add Payment Method',
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: _AddPaymentMethodScreen(),
      ),
    );
  }
}

class _AddPaymentMethodScreen extends StatefulWidget {
  const _AddPaymentMethodScreen({
    Key key,
  }) : super(key: key);
  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<_AddPaymentMethodScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StudentBloc>(
      create: (context) => StudentBloc()..add(GetBrandMyList()),
      child: BlocConsumer<StudentBloc, StudentState>(
          listenWhen: (previous, current) =>
              // previous.tagList != current.tagList ||
              previous.status != current.status,
          // previous.hasReachedMax != current.hasReachedMax ||
          // previous.brandSearchList != current.brandSearchList,
          listener: (context, state) {
            // if (!state.isRefresh) {
            //   switch (state.status) {
            //     case FormStatus.submissionInProgress:
            //       Dialogs.showLoadingDialog(context);
            //       break;
            //     case FormStatus.submissionSuccess:
            //       Dialogs.hideDialog(context);
            //       break;
            //     case FormStatus.submissionFailure:
            //       Dialogs.hideDialog(context);
            //       Dialogs.showErrorDialog(context, state.ProfileStatus);
            //       break;
            //     default:
            //   }
            // } else {
            //   if (state.status == FormStatus.submissionSuccess) {
            //     _refreshCompleter?.complete();
            //     _refreshCompleter = Completer();
            //   }
            // }
          },
          // buildWhen: (previous, current) =>
          //     previous.tagList != current.tagList ||
          //     previous.brandSearchList != current.brandSearchList,
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.WHITE,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(235, 238, 241, 1),
                            spreadRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputWithLableOnTop(
                          title: "Name On Card",
                          isRequired: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Full name as displayed on card",
                            style: TextStyle(
                                color: AppColors.DEEP_GREY,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10),
                        InputWithLableOnTop(
                          title: "Credit Card Number",
                          isRequired: true,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              child: InputWithLableOnTop(
                                title: "Exp. Month",
                                isRequired: true,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              child: InputWithLableOnTop(
                                title: "Exp. Year",
                                isRequired: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        InputWithLableOnTop(
                          title: "Billing Zip Code",
                          isRequired: true,
                        ),
                        SizedBox(height: 10),
                        InputWithLableOnTop(
                          title: "CVV",
                          isRequired: true,
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          padding: const EdgeInsets.only(
                              left: 30, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.GREEN_LIGHT,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.PRIMARY_SECOND,
                                  spreadRadius: 1),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Demo school requires that a payment method is used to auto-pay tiution when new invoices are created.',
                                maxLines: 10,
                                style: TextStyle(
                                  color: AppColors.PRIMARY_TRANSPARENT,
                                  fontSize: 15,
                                ),
                              ),
                              // Container(
                              //   width: MediaQuery.of(context).size.width - 120,
                              //   child: Text(
                              //     widget.description,
                              //     style: TextStyle(
                              //         color: AppColors.DEEP_GREY,
                              //         fontSize: 13,
                              //         fontWeight: FontWeight.w500),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1 -
                                    10,
                                child: CheckBoxInput(
                                  label: "",
                                  action: () => {},
                                  checked: true,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1 - 80,
                              padding:
                                  const EdgeInsets.only(left: 0, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Enable Auto-Pay using this payment method. New invoices will automatically be paid when they are created using this payment method',
                                    maxLines: 10,
                                    style: TextStyle(
                                      color: AppColors.DEEP_GREY,
                                      fontSize: 15,
                                    ),
                                  ),
                                  // Container(
                                  //   width: MediaQuery.of(context).size.width - 120,
                                  //   child: Text(
                                  //     widget.description,
                                  //     style: TextStyle(
                                  //         color: AppColors.DEEP_GREY,
                                  //         fontSize: 13,
                                  //         fontWeight: FontWeight.w500),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () => {},
                              color: AppColors.GREEN_BUTTON,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              child: Text(
                                "SAVE",
                                style: TextStyle(color: AppColors.WHITE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
