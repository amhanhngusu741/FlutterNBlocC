import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class SimpleTablePage extends StatelessWidget {
  SimpleTablePage({
    @required this.data,
    @required this.titleColumn,
    @required this.titleRow,
    @required this.stickyLegend,
    this.titleStyle,
    @required this.height,
    @required this.width,
    this.decoration,
    this.padding,
    this.margin,
  });

  final List<List<String>> data;
  final List<String> titleColumn;
  final List<String> titleRow;
  final String stickyLegend;
  final TextStyle titleStyle;
  final double height;
  final double width;
  final BoxDecoration decoration;
  final EdgeInsets padding;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: padding,
        margin: margin,
        decoration: decoration,
        child: StickyHeadersTable(
          cellDimensions: CellDimensions.uniform(height: height, width: width),
          columnsLength: titleColumn.length,
          rowsLength: titleRow.length,
          columnsTitleBuilder: (i) => Text(titleColumn[i], style: titleStyle),
          rowsTitleBuilder: (i) => Text(
            titleRow[i],
            style: TextStyle(fontSize: 14),
          ),
          contentCellBuilder: (i, j) => Text(data[i][j]),
          legendCell: Text(
            stickyLegend,
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}
