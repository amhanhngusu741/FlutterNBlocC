import 'dart:async';

import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/constants/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/style.dart';

import '../../blocs/blocs.dart';

class StudentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _StudentTab(),
    );
  }
}

class _StudentTab extends StatefulWidget {
  @override
  _StudentTabState createState() => _StudentTabState();
}

class _StudentTabState extends State<_StudentTab>
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
                                bottom: 15, top: 20, left: 10, right: 10),
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
                                          Row(
                                            children: [
                                              Text(
                                                'VIEW PROFILE ',
                                                // textScaleFactor: 2,
                                                style: TextStyle(
                                                  color: AppColors
                                                      .PRIMARY_TRANSPARENT,
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Icon(Icons.arrow_forward_ios,
                                                  size: 15,
                                                  color: AppColors
                                                      .PRIMARY_TRANSPARENT),
                                              SizedBox(width: 10.0)
                                            ],
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 50.0,
                width: 50.0,
                child: FloatingActionButton(
                  onPressed: () => {},
                  // tooltip: 'Increment Counter',
                  backgroundColor: AppColors.PRIMARY_TRANSPARENT,
                  child: Icon(Icons.add_outlined,
                      color: AppColors.WHITE, size: 30),
                  elevation: 0,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
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
