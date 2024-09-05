import 'dart:async';

import 'package:childcaresoftware/blocs/student/student_bloc.dart';
import 'package:childcaresoftware/screens/message/message_card.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Send Message',
      ),
      body: _SendMessageScreen(),
    );
  }
}

class _SendMessageScreen extends StatefulWidget {
  const _SendMessageScreen({
    Key key,
  }) : super(key: key);
  @override
  _SendMessageScreenState createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<_SendMessageScreen> {
  @override
  bool get wantKeepAlive => true;

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
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Select child this messsage is regading",
                      style: TextStyle(
                          color: AppColors.DEEP_GREY,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.GREEN_BUTTON,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.PRIMARY_SECOND, spreadRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Faiz, Ali',
                          maxLines: 10,
                          style: TextStyle(
                            color: AppColors.WHITE,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Messsage",
                      style: TextStyle(
                          color: AppColors.DEEP_GREY,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 1,
                    child: TextFormField(
                        minLines: 10,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        // controller: valueController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          filled: true,
                          fillColor: AppColors.WHITE,
                          // hintText: hint,
                          enabledBorder: new OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              borderSide:
                                  new BorderSide(color: AppColors.GREY_BORDER)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.GREY_BORDER),
                          ),
                          // prefixIcon: Icon(
                          //   Icons.stacked_bar_chart,
                          //   color: AppColors.PRIMARY,
                          //   size: 30,
                          // )
                        ),
                        onChanged: (value) => {
                              // print(value);
                            }),
                  ),
                  // SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.GREEN_BUTTON,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.PRIMARY_SECOND, spreadRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: AppColors.WHITE,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Attach Image',
                              maxLines: 10,
                              style: TextStyle(
                                color: AppColors.WHITE,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () => {},
                        color: AppColors.GREEN_BUTTON,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: Row(
                          children: [
                            Icon(
                              Icons.send,
                              color: AppColors.WHITE,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "SEND",
                              style: TextStyle(color: AppColors.WHITE),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
