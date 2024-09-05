import 'dart:async';

import 'package:childcaresoftware/blocs/student/student_bloc.dart';
import 'package:childcaresoftware/screens/profile/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Profile',
      ),
      body: Container(
          margin: EdgeInsets.only(bottom: 30), child: _ProfileScreen()),
    );
  }
}

class _ProfileScreen extends StatefulWidget {
  const _ProfileScreen({
    Key key,
  }) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_ProfileScreen> {
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
                      children: [
                        ProfileCard(
                          title: "Update Email",
                          icon: Icons.edit_note_outlined,
                        ),
                        ProfileCard(
                          title: "Update Name",
                          icon: Icons.edit_note_outlined,
                        ),
                        ProfileCard(
                          title: "Update Passworld",
                          icon: Icons.edit_note_outlined,
                        ),
                      ],
                    ),
                  ),
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
                      children: [
                        ProfileCardHeader(
                          title: "Profile Info",
                        ),
                        ProfileCard(
                          title: "AJ Ali",
                          icon: Icons.people_alt_outlined,
                        ),
                        ProfileCard(
                          title: "asifn77@hotmail.com",
                          icon: Icons.email_outlined,
                        ),
                        ProfileCardWithDropdow(
                          title: "Language",
                          icon: Icons.language_outlined,
                        ),
                      ],
                    ),
                  ),
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
                      children: [
                        ProfileCardHeader(
                          title: "Push Notifications",
                        ),
                        ProfileCardWithCheckBox(
                          title: "Messages",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "School Events",
                          // icon: Icons.child_care_rounded,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Activities",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        ProfileCardWithCheckBox(
                          title: "Images",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Videos",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Meals",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Naps",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Remindes",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Potty",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Medicine",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Incidents",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Curriculum",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Attendance",
                          // icon: Icons.child_care_rounded,
                        ),
                        ProfileCardWithCheckBox(
                          title: "Other",
                          // icon: Icons.child_care_rounded,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
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
                      children: [
                        ProfileCardHeader(
                          title: "Messages",
                        ),
                        ProfileCardWithDescription(
                          title: "Email/Text",
                          description:
                              "Receive messages from demo school via email and/or text.",
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
