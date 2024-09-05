import 'package:childcaresoftware/screens/payment/account_tab.dart';
import 'package:childcaresoftware/screens/payment/payment_setting_tab.dart';
import 'package:childcaresoftware/screens/student/student_tab.dart';
import 'package:flutter/material.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
import 'package:childcaresoftware/constants/color.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        label: 'Payment',
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: _PaymentScreen(),
      ),
    );
  }
}

class _PaymentScreen extends StatefulWidget {
  const _PaymentScreen({
    Key key,
  }) : super(key: key);
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<_PaymentScreen> {
  bool handle = false;
  final List<Tab> paymentTab = const <Tab>[
    const Tab(text: 'Accounts'),
    const Tab(text: 'Payment Settings'),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 60,
              color: AppColors.PRIMARY,
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 0.0),
                // tabs: productSearchTab,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text(paymentTab[0].text),
                      alignment: Alignment.center,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        // color: AppColors.TAB_SELECTED,
                        border: Border(
                          right: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(paymentTab[1].text),
                      alignment: Alignment.center,
                      height: double.infinity,
                      // decoration: const BoxDecoration(
                      //   // color: AppColors.TAB_SELECTED,
                      //   border: Border(
                      //     right: BorderSide(color: Colors.grey, width: 0.5),
                      //   ),
                      // ),
                    ),
                  ),
                ],
                unselectedLabelColor: AppColors.WHITE,
                labelColor: AppColors.PRIMARY_TRANSPARENT,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                indicatorColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: AppColors.TAB_SELECTED,
                ),
              ),
            ),
            Container(
              height: 2,
              color: AppColors.GREY,
            ),
            Expanded(
              child: Container(
                color: AppColors.BACKGROUND_COLOR,
                child: TabBarView(
                  children: <Widget>[
                    AccountTab(),
                    PaymentSettingTab(),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
