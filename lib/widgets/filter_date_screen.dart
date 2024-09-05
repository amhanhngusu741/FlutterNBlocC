import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:childcaresoftware/blocs/blocs.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/bottom_loader.dart';
import 'package:childcaresoftware/widgets/checkbox_input.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';
// import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:intl/intl.dart';
import 'date_minmax_input.dart';

class FilterDateScreen extends StatelessWidget {
  FilterDateScreen({
    GlobalKey<NavigatorState> navigatorKey,
    dynamic initList,
    Function action,
    Function startDateChange,
    Function endDateChange,
  }) {
    this.navigatorKey = navigatorKey;
    this.initList = initList;
    this.action = action;
    this.startDateChange = startDateChange;
    this.endDateChange = endDateChange;
    this.itemList = json.decode(json.encode(initList));
  }
  GlobalKey<NavigatorState> navigatorKey;
  dynamic initList;
  dynamic itemList;
  String keyLocalStorage;
  Function action;
  Function startDateChange;
  Function endDateChange;
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
              appBar: TopBarWithAction(
                label: 'Date Filter',
                action: () {
                  bool result = false;
                  String dateFilterValue = '30_days';
                  for (int i = 0; i < itemList.length; i++) {
                    if (itemList[i]['selected'] == true) {
                      result = true;
                      dateFilterValue = itemList[i]['value'];
                      break;
                    }
                  }
                  if (result == true) {
                    action(itemList, dateFilterValue);
                    Navigator.of(context).pop();
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please select a value",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.GREY_COLOR,
                        textColor: AppColors.WHITE,
                        fontSize: 14.0);
                  }
                },
              ),
              body: FilterDateList(
                itemList: itemList,
                startDateChange: startDateChange,
                endDateChange: endDateChange,
              ),
            ));
  }
}

class FilterDateList extends StatefulWidget {
  const FilterDateList(
      {Key key,
      this.itemList,
      this.removeAction,
      this.dragAction,
      this.startDateChange,
      this.endDateChange})
      : super(key: key);
  final dynamic itemList;
  final Function removeAction;
  final Function dragAction;
  final Function startDateChange;
  final Function endDateChange;

  @override
  FilterDateListState createState() => FilterDateListState();
}

class FilterDateListState extends State<FilterDateList>
    with AutomaticKeepAliveClientMixin {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final _scrollThreshold = 0.0;
  Completer<void> _refreshCompleter;
  bool isShowCustomDate = true;
  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    this.isShowCustomDate = checkShowCustomDate();
  }

  checkShowCustomDate() {
    bool result = false;
    if (widget.itemList[widget.itemList.length - 1]['selected'] == true) {
      result = true;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) {
        return index >= widget.itemList.length
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: BottomLoader())
            : index == widget.itemList.length - 1
                ? Column(
                    children: [
                      Item(
                          item: widget.itemList[index],
                          index: index,
                          enableAction: (index, value) {
                            for (int i = 0;
                                i < widget.itemList.toList().length;
                                i++) {
                              widget.itemList[i]['selected'] = false;
                            }
                            setState(() {
                              isShowCustomDate = value;
                              widget.itemList[index]['selected'] = value;
                            });
                          }),
                      Visibility(
                        visible: isShowCustomDate,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 55),
                          child: DatePeriodMinMaxInput(
                            startDate: DateTime.now(),
                            endDate: DateTime.now(),
                            minAction: (value) {
                              widget.itemList[widget.itemList.length - 1]
                                      ['startDate'] =
                                  DateFormat('yyyy-MM-dd').format(value);
                            },
                            maxAction: (value) {
                              widget.itemList[widget.itemList.length - 1]
                                      ['endDate'] =
                                  DateFormat('yyyy-MM-dd').format(value);
                            },
                            label: '',
                            rate: [0, 10],
                            contentStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                : Item(
                    item: widget.itemList[index],
                    index: index,
                    enableAction: (index, value) {
                      for (int i = 0;
                          i < widget.itemList.toList().length;
                          i++) {
                        widget.itemList[i]['selected'] = false;
                      }
                      setState(() {
                        widget.itemList[index]['selected'] = value;
                      });
                    });
      },
      itemCount: widget.itemList.length,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class Item extends StatelessWidget {
  Item({
    @required this.item,
    this.index,
    this.enableAction,
  });
  final dynamic item;
  final dynamic enableAction;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: -1, vertical: 0),
                      contentPadding: EdgeInsets.all(0),
                      leading: Transform.translate(
                        offset: Offset(-5.0, 0.0),
                        child: Icon(
                          item['selected']
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: AppColors.BLUE_BUTTON,
                          size: 30,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black),
                      ),
                      title: Transform.translate(
                        offset: Offset(-20.0, 0.0),
                        child:
                            Text(item['name'], style: TextStyle(fontSize: 18)),
                      ),
                      onTap: () {
                        this.enableAction(index, !item['selected']);
                      },
                    ),
                  ),
                ),
              ],
            ))
          ]),
    );
  }
}

enum DraggingMode {
  iOS,
  Android,
}
