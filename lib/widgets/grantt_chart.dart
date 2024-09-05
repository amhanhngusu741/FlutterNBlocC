import 'package:flutter/material.dart';
import 'dart:math';

class GranttChartScreen extends StatefulWidget {
  GranttChartScreen({
    Key key,
    this.itemListInChart,
    this.itemListDataInChart,
    this.fromDate,
    this.toDate,
  }) : super(key: key);
  final List<ItemList> itemListInChart;
  final List<ItemListData> itemListDataInChart;
  final DateTime fromDate;
  final DateTime toDate;
  @override
  State<StatefulWidget> createState() {
    return new GranttChartScreenState();
  }
}

class GranttChartScreenState extends State<GranttChartScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: Duration(microseconds: 2000), vsync: this);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: GanttChart(
            animationController: animationController,
            fromDate: widget.fromDate,
            toDate: widget.toDate,
            data: widget.itemListDataInChart,
            itemListInChart: widget.itemListInChart,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class GanttChart extends StatelessWidget {
  final AnimationController animationController;
  final DateTime fromDate;
  final DateTime toDate;
  final List<ItemListData> data;
  final List<ItemList> itemListInChart;

  int viewRange;
  int viewRangeToFitScreen = 6;
  Animation<double> width;

  GanttChart({
    this.animationController,
    this.fromDate,
    this.toDate,
    this.data,
    this.itemListInChart,
  }) {
    viewRange = calculateNumberOfMonthsBetween(fromDate, toDate);
  }

  Color randomColorGenerator() {
    var r = new Random();
    return Color.fromRGBO(r.nextInt(256), r.nextInt(256), r.nextInt(256), 0.75);
  }

  int calculateNumberOfMonthsBetween(DateTime from, DateTime to) {
    return to.month - from.month + 12 * (to.year - from.year) + 1;
  }

  int calculateDistanceToLeftBorder(DateTime projectStartedAt) {
    if (projectStartedAt.compareTo(fromDate) <= 0) {
      return 0;
    } else
      return calculateNumberOfMonthsBetween(fromDate, projectStartedAt) - 1;
  }

  int calculateRemainingWidth(
      DateTime projectStartedAt, DateTime projectEndedAt) {
    int projectLength =
        calculateNumberOfMonthsBetween(projectStartedAt, projectEndedAt);
    if (projectStartedAt.compareTo(fromDate) >= 0 &&
        projectStartedAt.compareTo(toDate) <= 0) {
      if (projectLength <= viewRange)
        return projectLength;
      else
        return viewRange -
            calculateNumberOfMonthsBetween(fromDate, projectStartedAt);
    } else if (projectStartedAt.isBefore(fromDate) &&
        projectEndedAt.isBefore(fromDate)) {
      return 0;
    } else if (projectStartedAt.isBefore(fromDate) &&
        projectEndedAt.isBefore(toDate)) {
      return projectLength -
          calculateNumberOfMonthsBetween(projectStartedAt, fromDate);
    } else if (projectStartedAt.isBefore(fromDate) &&
        projectEndedAt.isAfter(toDate)) {
      return viewRange;
    }
    return 0;
  }

  List<Widget> buildChartBars(
      List<ItemListData> data, double chartViewWidth, Color color) {
    List<Widget> chartBars = new List();

    for (int i = 0; i < data.length; i++) {
      var remainingWidth =
          calculateRemainingWidth(data[i].startTime, data[i].endTime);
      if (remainingWidth > 0) {
        chartBars.add(Container(
          decoration: BoxDecoration(
              color: color.withAlpha(100),
              borderRadius: BorderRadius.circular(5.0)),
          height: 25.0,
          width: remainingWidth * chartViewWidth / viewRangeToFitScreen,
          margin: EdgeInsets.only(
              left: calculateDistanceToLeftBorder(data[i].startTime) *
                  chartViewWidth /
                  viewRangeToFitScreen,
              top: i == 0 ? 4.0 : 2.0,
              bottom: i == data.length - 1 ? 4.0 : 2.0),
          alignment: Alignment.centerLeft,
          // child: Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: Text(
          //     data[i].name,
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(fontSize: 10.0),
          //   ),
          // ),
        ));
      }
    }

    return chartBars;
  }

  Widget buildHeader(double chartViewWidth, Color color) {
    List<Widget> headerItems = new List();
    DateTime tempDate = fromDate;
    headerItems.add(Container(
      width: chartViewWidth / viewRangeToFitScreen,
      child: new Text(
        '',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.0,
        ),
      ),
    ));

    for (int i = 0; i < viewRange; i++) {
      headerItems.add(Container(
        width: chartViewWidth / viewRangeToFitScreen,
        child: new Text(
          tempDate.month.toString() + '/' + tempDate.year.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.0,
          ),
        ),
      ));
      tempDate = new DateTime(tempDate.year, tempDate.month + 1, tempDate.day);
    }

    return Container(
      height: 25.0,
      color: color.withAlpha(100),
      child: Row(
        children: headerItems,
      ),
    );
  }

  Widget buildGrid(double chartViewWidth) {
    List<Widget> gridColumns = new List();
    for (int i = 0; i <= viewRange; i++) {
      gridColumns.add(Container(
        decoration: BoxDecoration(
            border: Border(
                right:
                    BorderSide(color: Colors.grey.withAlpha(100), width: 1.0))),
        width: chartViewWidth / viewRangeToFitScreen,
        //height: 300.0,
      ));
    }

    return Row(
      children: gridColumns,
    );
  }

  Widget buildChartForEachUser(List<ItemListData> itemListDataInChart,
      double chartViewWidth, ItemList user) {
    Color color = randomColorGenerator();
    var chartBars = buildChartBars(itemListDataInChart, chartViewWidth, color);
    return Container(
      height: chartBars.length * 29.0 + 25.0 + 4.0 + 30,
      child: ListView(
        physics: new ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Stack(fit: StackFit.loose, children: <Widget>[
            buildGrid(chartViewWidth),
            buildHeader(chartViewWidth, color),
            Container(
                margin: EdgeInsets.only(top: 25.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: chartViewWidth / viewRangeToFitScreen,
                                height: chartBars.length * 29.0 + 4.0 + 30,
                                color: color.withAlpha(100),
                                child: Center(
                                  child: new RotatedBox(
                                    quarterTurns:
                                        chartBars.length * 29.0 + 4.0 > 50
                                            ? 0
                                            : 0,
                                    child: new Text(
                                      user.name,
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: chartBars,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ]),
        ],
      ),
    );
  }

  List<Widget> buildChartContent(double chartViewWidth) {
    List<Widget> chartContent = new List();
    itemListInChart.forEach((user) {
      List<ItemListData> projectsOfUser = new List();
      projectsOfUser = this
          .data
          .where((project) => project.itemListId.indexOf(user.id) != -1)
          .toList();
      if (projectsOfUser.length > 0) {
        chartContent
            .add(buildChartForEachUser(projectsOfUser, chartViewWidth, user));
      }
    });
    return chartContent;
  }

  @override
  Widget build(BuildContext context) {
    var chartViewWidth = MediaQuery.of(context).size.width;
    var screenOrientation = MediaQuery.of(context).orientation;

    screenOrientation == Orientation.landscape
        ? viewRangeToFitScreen = 12
        : viewRangeToFitScreen = 6;

    return Container(
      child: MediaQuery.removePadding(
        child: ListView(children: buildChartContent(chartViewWidth)),
        removeTop: true,
        context: context,
      ),
    );
  }
}

var itemList = [
  ItemList(id: 1, name: 'Steve'),
  ItemList(id: 2, name: 'Leila'),
  ItemList(id: 3, name: 'Alex'),
  ItemList(id: 4, name: 'Ryan'),
];

var itemListData = [
  ItemListData(
      id: 1,
      name: 'Steve',
      startTime: DateTime(2017, 3, 2),
      endTime: DateTime(2018, 6, 10),
      itemListId: [1]),
  ItemListData(
      id: 2,
      name: 'Leila',
      startTime: DateTime(2018, 4, 1),
      endTime: DateTime(2018, 6, 1),
      itemListId: [2]),
  ItemListData(
      id: 3,
      name: 'Alex',
      startTime: DateTime(2017, 5, 1),
      endTime: DateTime(2018, 9, 1),
      itemListId: [3]),
  ItemListData(
      id: 4,
      name: 'Ryan',
      startTime: DateTime(2018, 6, 1),
      endTime: DateTime(2018, 10, 1),
      itemListId: [4]),
];

class ItemList {
  int id;
  String name;
  ItemList({this.id, this.name});
}

class ItemListData {
  int id;
  String name;
  DateTime startTime;
  DateTime endTime;
  List<int> itemListId = [];
  ItemListData(
      {this.id, this.name, this.startTime, this.endTime, this.itemListId});
}
