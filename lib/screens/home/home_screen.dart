import 'package:childcaresoftware/screens/activity/activity_router.dart';
import 'package:childcaresoftware/screens/checkin/checkin_router.dart';
import 'package:childcaresoftware/screens/checkin/checkin_screen.dart';
import 'package:childcaresoftware/screens/dashboard_teacher/dashboard_teacher_router.dart';
import 'package:childcaresoftware/screens/learning/learning_router.dart';
import 'package:childcaresoftware/screens/message/message_router.dart';
import 'package:childcaresoftware/screens/payment/payment_router.dart';
import 'package:childcaresoftware/screens/profile/profile_router.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/commons/dialogs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/screens/screens.dart';
import 'package:childcaresoftware/screens/settings/settings_router.dart';
import 'package:childcaresoftware/screens/student/student_router.dart';
import 'package:childcaresoftware/service_locator.dart';
import 'package:childcaresoftware/widgets/widgets.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:childcaresoftware/repositories/repositories.dart';

import '../../commons/variables.dart';
import '../add_payment_method/add_payment_method_router.dart';
import '../calendar/calendar_router.dart';
import '../checkout/checkout_router.dart';
import '../teacher/teacher_router.dart';
import '../tuition/tuition_router.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static final List<Widget> teacher = [
    ActivityRouter(),
    StudentRouter(),
    DashboardTeacherRouter(),
    TeacherRouter(),
    TuitionRouter(),
  ];
  static final List<Widget> parent = [
    ActivityRouter(),
    CalendarRouter(),
    CheckInRouter(),
    MessageRouter(),
    LearningRouter(),
  ];
  final List<Widget> _originalList = Variables.isTeacher ? teacher : parent;
  Map<int, bool> _originalDic;
  List<Widget> _listScreens;
  List<int> _listScreensIndex = [0];
  int tabIndex = 0;
  bool isEditing = false;
  static final menuTeacher = [
    _BottomAppBarItem(
        iconData: Icons.local_activity_outlined, text: 'Activity'),
    _BottomAppBarItem(iconData: Icons.assignment_ind_outlined, text: 'Student'),
    _BottomAppBarItem(iconData: Icons.home_outlined, text: 'Dashboard'),
    _BottomAppBarItem(
        iconData: Icons.supervised_user_circle_outlined, text: 'Teacher'),
    _BottomAppBarItem(iconData: Icons.description_outlined, text: 'Tuition'),
  ];
  static final menuParent = [
    _BottomAppBarItem(
        iconData: Icons.local_activity_outlined, text: 'Activity'),
    _BottomAppBarItem(
        iconData: Icons.calendar_month_outlined, text: 'Calendar'),
    _BottomAppBarItem(iconData: Icons.home_outlined, text: 'Home'),
    _BottomAppBarItem(iconData: Icons.message_outlined, text: 'Message'),
    _BottomAppBarItem(iconData: Icons.book_outlined, text: 'Learning'),
  ];
  final listItems = Variables.isTeacher ? menuTeacher : menuParent;
  // List<int> tabStack = [0];
  DateTime currentBackPressTime;
  String startScreen;

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 1000), () {
    //   firebaseMessaging.requestPermission();
    // });

    // firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //     // Navigator.pushNamed(context, AppRouter.JOBS_DETAIL,
    //     //     arguments: JobDetailScreenArguments(jobId: 1, positionId: 1));
    //     Navigator.pushNamed(context, ScheduleRouter.JOBS_DETAIL,
    //         arguments: JobDetailScreenArguments(jobId: 1, positionId: 1));
    //   },
    //   onBackgroundMessage: myBackgroundMessageHandler,
    // );
    // firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(
    //         sound: true, badge: true, alert: true, provisional: true));

    // firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
    // firebaseMessaging.getToken().then((value) {
    //   print('Firebase Token: ' + value);
    // });

    getStartScreen().then((startScreen) {
      if (startScreen != null) {
        _originalDic = {
          0: false,
          1: false,
          2: false,
          3: false,
          4: false,
        };
        tabIndex = int.parse(startScreen);
        _originalDic[int.parse(startScreen)] = true;
        _listScreens = [_originalList.elementAt(int.parse(startScreen))];
        _listScreensIndex = [int.parse(startScreen)];
      } else {
        _originalDic = {
          0: true,
          1: false,
          2: false,
          3: false,
          4: false,
        };
        _listScreens = [_originalList.first];
      }
    });
  }

  @override
  Widget build(BuildContext rootContext) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider<BrandSearchBloc>(create: (context) {
          //   return BrandSearchBloc()..add(GetBrandList());
          // }),
          BlocProvider<ProfileBloc>(create: (context) {
            return ProfileBloc()..add(GetProfile());
          }),
          BlocProvider<SettingsBloc>(create: (context) {
            return SettingsBloc()..add(SettingsLoaded());
          }),
        ],
        child:
            BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
          final unread = null;

          // print(tabIndex);
          return WillPopScope(
            onWillPop: () async {
              if (tabIndex == 1) {
                var isPopped = false;
                // await JobsRouter.navigatorKey.currentState.maybePop();
                // if (!isPopped) {
                //   tabStack.removeLast();
                //   _selectedTab(tabStack.last, context);
                //   return Future.value(false);
                // }
                DateTime now = DateTime.now();
                if (!isPopped &&
                    (currentBackPressTime == null ||
                        now.difference(currentBackPressTime) >
                            Duration(seconds: 3))) {
                  currentBackPressTime = now;
                  Fluttertoast.showToast(
                      msg: "Press again to exit app",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: AppColors.GREY_COLOR,
                      textColor: AppColors.WHITE,
                      fontSize: 14.0);
                  return Future.value(false);
                }
                return Future.value(!isPopped);
              }
              // if (tabIndex != 0) {
              //   tabStack.removeLast();
              //   _selectedTab(tabStack.last, context);
              //   return Future.value(false);
              // }
              DateTime now = DateTime.now();
              if (currentBackPressTime == null ||
                  now.difference(currentBackPressTime) > Duration(seconds: 3)) {
                currentBackPressTime = now;
                Fluttertoast.showToast(
                    msg: "Press again to exit app",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: AppColors.GREY_COLOR,
                    textColor: AppColors.WHITE,
                    fontSize: 14.0);
                return Future.value(false);
              }
              return Future.value(true);
            },
            child: Scaffold(
              body: IndexedStack(
                  index: _listScreensIndex.indexOf(tabIndex),
                  children: _listScreens == null ? [] : _listScreens),
              bottomNavigationBar: _buildTabBar(unread),
              floatingActionButton: Container(
                height: 75.0,
                width: 75.0,
                child: FloatingActionButton(
                  onPressed: () => _selectedTab(2, context),
                  backgroundColor: AppColors.BACKGROUND_BODY,
                  child: Container(
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      color: AppColors.WHITE,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.home_outlined,
                        color: AppColors.PRIMARY_TRANSPARENT, size: 30),
                  ),
                  elevation: 0,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          );
        }));
  }

  getStartScreen() async {
    final startScreen = await locator<SettingsRepository>().getStartScreen();
    return startScreen;
  }

  void _selectedTab(int index, BuildContext context) {
    if (_originalDic[index] == false) {
      _listScreensIndex.add(index);
      _originalDic[index] = true;
      _listScreensIndex.sort();
      _listScreens = _listScreensIndex.map((index) {
        return _originalList[index];
      }).toList();
    }
    _sendCurrentTabToAnalytics(index);
    setState(() {
      this.tabIndex = index;
    });
    // }
  }

  Widget _buildTabBar(unread) {
    final items = List.generate(listItems.length, (int index) {
      return _buildTabItem(
        item: listItems[index],
        index: index,
        onPressed: _selectedTab,
        unread: unread,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: AppColors.PRIMARY,
    );
  }

  Widget _buildTabItem({
    _BottomAppBarItem item,
    int index,
    Function onPressed,
    int unread,
    BuildContext context,
  }) {
    final color =
        tabIndex == index ? AppColors.PRIMARY_TRANSPARENT : AppColors.WHITE;
    return Builder(
      builder: (context) => Expanded(
        child: SizedBox(
          height: 60,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => onPressed(index, context),
              child: Container(
                padding: EdgeInsets.only(top: 8),
                color:
                    tabIndex == index ? AppColors.PRIMARY : AppColors.PRIMARY,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    item.text == 'Alerts' && unread > 0
                        ? Badge(
                            position:
                                BadgePosition.bottomEnd(bottom: 8, end: -10),
                            badgeContent: Text(
                              unread.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            child: Icon(item.iconData, color: color, size: 30),
                          )
                        : item.text.toLowerCase() == 'dashboard'
                            ? Icon(null)
                            : Icon(item.iconData, color: color, size: 30),
                    Padding(
                      padding: item.text.toLowerCase() == 'dashboard'
                          ? const EdgeInsets.only(top: 14)
                          : const EdgeInsets.only(top: 8),
                      child: Text(
                        item.text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: color, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _sendCurrentTabToAnalytics(int tabIndex) {
    // MyApp.observer.analytics.setCurrentScreen(
    //   screenName: '${_originalList[tabIndex].toString()}',
    // );
  }
}

class _BottomAppBarItem {
  _BottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}
