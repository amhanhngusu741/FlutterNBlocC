import 'dart:async';

import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/style.dart';

import '../../blocs/blocs.dart';

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _AccountTab(),
    );
  }
}

class _AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<_AccountTab>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final _scrollThreshold = 0.0;
  Completer<void> _refreshCompleter;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            //       Dialogs.showErrorDialog(context, state.messageStatus);
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
            return Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 16,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 10, top: 10, left: 10, right: 10),
                            width: MediaQuery.of(context).size.width * 1,
                            height: 70,
                            child: Row(
                              children: [
                                Stack(children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 50, top: 10),
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width - 86,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.WHITE,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                235, 238, 241, 1),
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Charley McNeal',
                                            // textScaleFactor: 2,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: 70,
                                      height: 70,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: AppColors.WHITE,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  235, 238, 241, 1),
                                              spreadRadius: 1),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 0,
                                        backgroundColor: Colors.red,
                                        child: ClipOval(
                                            child: Image.asset(
                                                'assets/images/avt1.jpeg')),
                                      ))
                                ]),
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(
                          //       bottom: 15, top: 0, left: 30, right: 10),
                          //   child: Text(
                          //     "America's choice Children Center 3 Active",
                          //     style: TextStyle(
                          //         color: AppColors.GREY_COLOR, fontSize: 15),
                          //   ),
                          // ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.WHITE,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(235, 238, 241, 1),
                                    spreadRadius: 1),
                              ],
                            ),
                            margin: EdgeInsets.only(
                                bottom: 15, top: 10, left: 10, right: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 56,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromRGBO(222, 243, 242, 1),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                222, 243, 242, 1),
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'My current balance',
                                            // textScaleFactor: 2,
                                            style: TextStyle(
                                                color: AppColors.BLACK,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                            '\$0.00',
                                            // textScaleFactor: 2,
                                            style: TextStyle(
                                                color: AppColors
                                                    .PRIMARY_TRANSPARENT,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.WHITE,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                235, 238, 241, 1),
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              width: 50,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color.fromRGBO(
                                                    222, 243, 242, 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors.WHITE,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                              child: Icon(Icons.info_outline,
                                                  size: 25,
                                                  color: AppColors
                                                      .PRIMARY_TRANSPARENT),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                '0 Past due invoices',
                                                // textScaleFactor: 2,
                                                style: TextStyle(
                                                    color: AppColors.DEEP_GREY,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                            '\$0.00',
                                            // textScaleFactor: 2,
                                            style: TextStyle(
                                                color: AppColors.DEEP_GREY,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.WHITE,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                235, 238, 241, 1),
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              width: 50,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color.fromRGBO(
                                                    222, 243, 242, 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors.WHITE,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                              child: Icon(
                                                  Icons.price_change_outlined,
                                                  size: 25,
                                                  color: AppColors
                                                      .PRIMARY_TRANSPARENT),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                '0 Current invoices',
                                                // textScaleFactor: 2,
                                                style: TextStyle(
                                                    color: AppColors.DEEP_GREY,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                            '\$0.00',
                                            // textScaleFactor: 2,
                                            style: TextStyle(
                                                color: AppColors.DEEP_GREY,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.WHITE,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                235, 238, 241, 1),
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              width: 50,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color.fromRGBO(
                                                    222, 243, 242, 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors.WHITE,
                                                      spreadRadius: 1),
                                                ],
                                              ),
                                              child: Icon(
                                                  Icons.payments_outlined,
                                                  size: 25,
                                                  color: AppColors
                                                      .PRIMARY_TRANSPARENT),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Available Credits & Payments',
                                                    // textScaleFactor: 2,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.DEEP_GREY,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Icon(
                                                        Icons.info_outline,
                                                        size: 20,
                                                        color: AppColors
                                                            .GREY_COLOR),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromRGBO(222, 243, 242, 1),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                222, 243, 242, 1),
                                            spreadRadius: 1),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                '\$0.00 due across all payers',
                                                // textScaleFactor: 2,
                                                style: TextStyle(
                                                    color: AppColors.DEEP_GREY,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Icon(Icons.info_outline,
                                                    size: 20,
                                                    color: AppColors
                                                        .PRIMARY_TRANSPARENT),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // final hasReachedMax =
    // BlocProvider.of<JobsSavedBloc>(context).state.hasReachedMax;
    // if (maxScroll == currentScroll && !hasReachedMax) {
    // BlocProvider.of<JobsSavedBloc>(context).add(JobsSavedDataFetched());
    // }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
