import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/models/user_register.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class TagCustom extends StatefulWidget {
  TagCustom({
    Key key,
    this.title,
    this.action,
    this.remove,
    this.hint,
    this.requiredLenght = 0,
    this.toast,
    this.isReload = false,
    this.suggestions = const [],
    this.change,
  }) : super(key: key);
  final String title;
  final String hint;
  final String toast;
  final int requiredLenght;
  final Function(dynamic) action;
  final Function(dynamic) remove;
  bool isReload;
  final List<String> suggestions;
  final Function(dynamic) change;
  @override
  _TagCustomState createState() => _TagCustomState();
}

class _TagCustomState extends State<TagCustom>
    with SingleTickerProviderStateMixin {
  final List<String> _list = [];
  double _fontSize = 18;
  @override
  void initState() {
    super.initState();
    _items = _list.toList();
  }

  List _items;
  @override
  Widget build(BuildContext context) {
    if (widget.isReload) {
      setState(() {
        _items = [];
      });
    }
    return Container(
        child: !widget.isReload
            ? _tags
            : Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextFormField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10, bottom: 0, top: 0, right: 10),
                          filled: true,
                          fillColor: AppColors.WHITE,
                          hintText: widget.hint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: new BorderSide(color: AppColors.BLACK),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }

  Widget get _tags {
    ItemTagsCombine combine = ItemTagsCombine.onlyText;
    combine = ItemTagsCombine.onlyText;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Tags(
          symmetry: false,
          verticalDirection: VerticalDirection.up,
          textDirection: TextDirection.ltr,
          heightHorizontalScroll: 60 * (_fontSize / 14),
          textField: _textField,
          itemCount: _items.length,
          itemBuilder: (index) {
            final item = _items[index];
            return GestureDetector(
              child: new ItemTags(
                padding: const EdgeInsets.all(7.0),
                key: Key(index.toString()),
                index: index,
                title: item,
                pressEnabled: false,
                activeColor: AppColors.PRIMARY_SECOND,
                combine: combine,
                removeButton: ItemTagsRemoveButton(
                  backgroundColor: AppColors.PRIMARY,
                  onRemoved: () {
                    widget.remove(index);
                    setState(() {
                      _items.removeAt(index);
                    });
                    return true;
                  },
                ),
                textScaleFactor:
                    utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1,
                textStyle: TextStyle(
                  fontSize: _fontSize,
                ),
              ),
            );
          }),
    );
  }

  TagsTextField get _textField {
    return TagsTextField(
      suggestions: widget.suggestions.length < 1 ? null : widget.suggestions,
      suggestionTextColor: AppColors.DEEP_GREY,
      autofocus: true,
      inputDecoration: InputDecoration(
        suffixText: (_items.length + 1).toString(),
        counterText: "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: new BorderSide(color: AppColors.BLACK),
        ),
        contentPadding: EdgeInsets.only(left: 10, bottom: 0, top: 0, right: 10),
      ),

      width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 10),
      textStyle: TextStyle(
        fontSize: _fontSize,
      ),
      maxLength: widget.requiredLenght > 0 ? widget.requiredLenght : 100,
      hintText: widget.hint,
      enabled: true,
      constraintSuggestion: true,
      onChanged: (String str) {
        widget.change(str);
      },
      onSubmitted: (String str) {
        if (widget.requiredLenght > 0 && str.length != widget.requiredLenght) {
          Fluttertoast.showToast(
              msg: widget.toast,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: AppColors.GREY_COLOR,
              textColor: AppColors.WHITE,
              fontSize: 18.0);
        } else {
          widget.action(str);
          setState(() {
            _items.add(str);
          });
        }
      },
    );
  }
}

class TagText extends StatelessWidget {
  TagText(
      {Key key,
      this.action,
      this.label = '',
      this.value = '',
      this.icon,
      this.isBorder = false,
      this.backgroundColor = AppColors.GREEN_BUTTON,
      this.color = AppColors.WHITE,
      this.valueColor = AppColors.WHITE,
      this.radius = 5,
      this.height = 40,
      this.width,
      this.borderColor})
      : super(key: key);

  final String label;
  final String value;
  final IconData icon;
  final bool isBorder;
  final Function action;
  final Color backgroundColor;
  final Color color;
  final double radius;
  final double height;
  final double width;
  final Color borderColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: this.height,
          width: this.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.radius),
            border: borderColor != null
                ? Border.all(
                    color: this.borderColor,
                    width: 1,
                  )
                : null,
            color: this.backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: 5),
              Text(
                this.label.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                ),
              ),
              Text(
                this.value,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: valueColor,
                  fontSize: 16,
                ),
              ),
              this.icon != null
                  ? Icon(
                      this.icon,
                      size: 16,
                      color: this.color,
                    )
                  : Text(''),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
      onTap: () {
        action();
      },
    );
  }
}
