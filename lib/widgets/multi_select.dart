import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/top_bar.dart';

class MultiSelectCustom extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final bool filterable;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final int maxLength;
  final Color inputBoxFillColor;
  final Color errorBorderColor;
  final Color enabledBorderColor;
  final String maxLengthText;
  final Color maxLengthIndicatorColor;
  final Color titleTextColor;
  final IconData selectIcon;
  final Color selectIconColor;
  final Color hintTextColor;
  // modal overrides
  final Color buttonBarColor;
  final String cancelButtonText;
  final IconData cancelButtonIcon;
  final Color cancelButtonColor;
  final Color cancelButtonTextColor;
  final String saveButtonText;
  final IconData saveButtonIcon;
  final Color saveButtonColor;
  final Color saveButtonTextColor;
  final String deleteButtonTooltipText;
  final IconData deleteIcon;
  final Color deleteIconColor;
  final Color selectedOptionsBoxColor;
  final String selectedOptionsInfoText;
  final Color selectedOptionsInfoTextColor;
  final IconData checkedIcon;
  final IconData uncheckedIcon;
  final Color checkBoxColor;
  final Color searchBoxColor;
  final String searchBoxHintText;
  final Color searchBoxFillColor;
  final IconData searchBoxIcon;
  final String searchBoxToolTipText;
  final bool isShowSelectedOptions;
  final List<dynamic> initialValue;
  final bool isSelectAll;
  MultiSelectCustom({
    FormFieldSetter<dynamic> onSaved,
    FormFieldValidator<dynamic> validator,
    this.initialValue = const [],
    bool autovalidate = false,
    this.titleText = 'Title',
    this.titleTextColor,
    this.hintText = 'Tap to select one or more...',
    this.hintTextColor = Colors.grey,
    this.required = false,
    this.errorText = 'Please select one or more option(s)',
    this.value,
    this.leading,
    this.filterable = true,
    this.dataSource,
    this.textField,
    this.valueField,
    this.change,
    this.open,
    this.close,
    this.trailing,
    this.maxLength,
    this.maxLengthText,
    this.maxLengthIndicatorColor = Colors.red,
    this.inputBoxFillColor = Colors.white,
    this.errorBorderColor = Colors.red,
    this.enabledBorderColor = Colors.grey,
    this.selectIcon = Icons.arrow_downward,
    this.selectIconColor,
    this.buttonBarColor,
    this.cancelButtonText,
    this.cancelButtonIcon,
    this.cancelButtonColor,
    this.cancelButtonTextColor,
    this.saveButtonText,
    this.saveButtonIcon,
    this.saveButtonColor,
    this.saveButtonTextColor,
    this.deleteButtonTooltipText,
    this.deleteIcon,
    this.deleteIconColor,
    this.selectedOptionsBoxColor,
    this.selectedOptionsInfoText,
    this.selectedOptionsInfoTextColor,
    this.checkedIcon,
    this.uncheckedIcon,
    this.checkBoxColor,
    this.searchBoxColor,
    this.searchBoxHintText,
    this.searchBoxFillColor,
    this.searchBoxIcon,
    this.searchBoxToolTipText,
    this.isShowSelectedOptions,
    this.isSelectAll = true,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            // autovalidateMode: false,
            builder: (FormFieldState<dynamic> state) {
              List<Widget> _buildSelectedOptions(dynamic values, state) {
                List<Widget> selectedOptions = [];
                if (values != null) {
                  values.forEach((item) {
                    var existingItem = dataSource.singleWhere(
                        (itm) => itm[valueField] == item,
                        orElse: () => null);
                    if (existingItem != null) {
                      selectedOptions.add(Chip(
                        label: Text(
                          existingItem[textField],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppColors.BLACK),
                        ),
                        backgroundColor: AppColors.PRIMARY_SECOND,
                      ));
                    }
                  });
                }

                return selectedOptions;
              }

              String nameSelected = hintText;
              if (isSelectAll == false && value.length > 0) {
                for (int i = 0; i < dataSource.length; i++) {
                  if (value[0] == dataSource[i]['id'])
                    nameSelected = dataSource[i]['name'];
                }
              }

              return InkWell(
                  onTap: () async {
                    var results = await Navigator.push(
                        state.context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>
                              SelectionModalCustom(
                            title: titleText,
                            filterable: filterable,
                            valueField: valueField,
                            textField: textField,
                            dataSource: dataSource,
                            values: value ?? [],
                            maxLength: maxLength ?? dataSource?.length,
                            buttonBarColor: buttonBarColor,
                            cancelButtonText: cancelButtonText,
                            cancelButtonIcon: cancelButtonIcon,
                            cancelButtonColor: cancelButtonColor,
                            cancelButtonTextColor: cancelButtonTextColor,
                            saveButtonText: saveButtonText,
                            saveButtonIcon: saveButtonIcon,
                            saveButtonColor: saveButtonColor,
                            saveButtonTextColor: saveButtonTextColor,
                            deleteButtonTooltipText: deleteButtonTooltipText,
                            deleteIcon: deleteIcon,
                            deleteIconColor: deleteIconColor,
                            selectedOptionsBoxColor: selectedOptionsBoxColor,
                            selectedOptionsInfoText: selectedOptionsInfoText,
                            selectedOptionsInfoTextColor:
                                selectedOptionsInfoTextColor,
                            checkedIcon: checkedIcon,
                            uncheckedIcon: uncheckedIcon,
                            checkBoxColor: checkBoxColor,
                            searchBoxColor: searchBoxColor,
                            searchBoxHintText: searchBoxHintText,
                            searchBoxFillColor: searchBoxFillColor,
                            searchBoxIcon: searchBoxIcon,
                            searchBoxToolTipText: searchBoxToolTipText,
                            isShowSelectedOptions: isShowSelectedOptions,
                            isSelectAll: isSelectAll,
                          ),
                          fullscreenDialog: true,
                        ));

                    if (results != null) {
                      dynamic newValue;
                      if (results.length > 0) {
                        newValue = results;
                      }
                      state.didChange(newValue);
                      if (change != null) {
                        change(newValue);
                      }
                      onSaved(newValue);
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: inputBoxFillColor,
                      contentPadding: EdgeInsets.only(left: 10.0, right: 5.0),
                      // errorBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      //     borderSide: BorderSide(color: errorBorderColor)),
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      //     borderSide: BorderSide(color: enabledBorderColor)),
                      errorText: state.hasError ? state.errorText : null,
                      errorMaxLines: 50,
                    ),
                    isEmpty: (value == null ||
                        value == '' ||
                        (value != null && value.length == 0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        (value == null ||
                                value == '' ||
                                (value != null && value.length == 0))
                            ? new Container(
                                child: Text(
                                  hintText,
                                  style: TextStyle(
                                      color: hintTextColor, fontSize: 16),
                                ),
                              )
                            // : Wrap(
                            //     spacing: 5.0, // gap between adjacent chips
                            //     runSpacing: -5, // gap between lines
                            //     children: _buildSelectedOptions(value, state),
                            //   )
                            : isSelectAll == false
                                ? Container(
                                    child: Text(
                                      nameSelected,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )
                                : new Container(
                                    child: Text(
                                      value.length.toString() + ' Selected',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                        Container(
                          child: Icon(Icons.arrow_drop_down,
                              color: AppColors.BLACK),
                        )
                      ],
                    ),
                  ));
            });
}

class SelectionModalCustom extends StatefulWidget {
  @override
  _SelectionModalCustomState createState() => _SelectionModalCustomState();

  final List dataSource;
  final List values;
  final bool filterable;
  final String textField;
  final String valueField;
  final String title;
  final int maxLength;
  final Color buttonBarColor;
  final String cancelButtonText;
  final IconData cancelButtonIcon;
  final Color cancelButtonColor;
  final Color cancelButtonTextColor;
  final String saveButtonText;
  final IconData saveButtonIcon;
  final Color saveButtonColor;
  final Color saveButtonTextColor;
  final String deleteButtonTooltipText;
  final IconData deleteIcon;
  final Color deleteIconColor;
  final Color selectedOptionsBoxColor;
  final String selectedOptionsInfoText;
  final Color selectedOptionsInfoTextColor;
  final IconData checkedIcon;
  final IconData uncheckedIcon;
  final Color checkBoxColor;
  final Color searchBoxColor;
  final String searchBoxHintText;
  final Color searchBoxFillColor;
  final IconData searchBoxIcon;
  final String searchBoxToolTipText;
  final bool isShowSelectedOptions;
  final bool isSelectAll;
  SelectionModalCustom({
    this.filterable,
    this.dataSource,
    this.title = 'Please select one or more option(s)',
    this.values,
    this.textField,
    this.valueField,
    this.maxLength,
    this.buttonBarColor,
    this.cancelButtonText,
    this.cancelButtonIcon,
    this.cancelButtonColor,
    this.cancelButtonTextColor,
    this.saveButtonText,
    this.saveButtonIcon,
    this.saveButtonColor,
    this.saveButtonTextColor,
    this.deleteButtonTooltipText,
    this.deleteIcon,
    this.deleteIconColor,
    this.selectedOptionsBoxColor,
    this.selectedOptionsInfoText,
    this.selectedOptionsInfoTextColor,
    this.checkedIcon,
    this.uncheckedIcon,
    this.checkBoxColor,
    this.searchBoxColor,
    this.searchBoxHintText,
    this.searchBoxFillColor,
    this.searchBoxIcon,
    this.searchBoxToolTipText,
    this.isShowSelectedOptions = true,
    this.isSelectAll = true,
  }) : super();
}

class _SelectionModalCustomState extends State<SelectionModalCustom> {
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  bool _isSearching;
  bool isSelectedAll = false;
  List _localDataSourceWithState = [];
  List _searchresult = [];

  _SelectionModalCustomState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
        });
      } else {
        setState(() {
          _isSearching = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.dataSource.forEach((item) {
      var newItem = {
        'value': item[widget.valueField],
        'text': item[widget.textField],
        'checked': widget.values.contains(item[widget.valueField])
      };
      _localDataSourceWithState.add(newItem);
    });
    isSelectedAll = false;
    _searchresult = List.from(_localDataSourceWithState);
    _isSearching = false;
  }

  Widget _buildAppBar(BuildContext context) {
    // return AppBar(
    //   leading: Container(),
    //   elevation: 0.0,
    //   title: Text(widget.title, style: TextStyle(fontSize: 16.0)),
    //   actions: <Widget>[
    //     IconButton(
    //       icon: Icon(
    //         Icons.close,
    //         size: 26.0,
    //       ),
    //       onPressed: () {
    //         Navigator.pop(context, null);
    //       },
    //     ),
    //   ],
    // );
    return AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.WHITE, //change your color here
        ),
        backgroundColor: AppColors.PRIMARY,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              this.widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.WHITE,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check, color: AppColors.WHITE, size: 30),
            onPressed: _localDataSourceWithState
                        .where((item) => item['checked'])
                        .length >
                    widget.maxLength
                ? null
                : () {
                    var selectedValuesObjectList = _localDataSourceWithState
                        .where((item) => item['checked'])
                        .toList();
                    var selectedValues = [];
                    selectedValuesObjectList.forEach((item) {
                      selectedValues.add(item['value']);
                    });
                    Navigator.pop(context, selectedValues);
                  },
          ),
        ]);
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          widget.filterable ? _buildSearchText() : new SizedBox(),

          Expanded(
            child: _optionsList(),
          ),
          _currentlySelectedOptions(),
          // Container(
          //   color: widget.buttonBarColor ?? Colors.grey.shade600,
          //   child: ButtonBar(
          //       alignment: MainAxisAlignment.spaceBetween,
          //       mainAxisSize: MainAxisSize.max,
          //       children: <Widget>[
          //         ButtonTheme(
          //           shape: new RoundedRectangleBorder(
          //               borderRadius: new BorderRadius.circular(30.0)),
          //           height: 40.0,
          //           child: RaisedButton.icon(
          //             label: Text(widget.cancelButtonText ?? 'Cancel'),
          //             icon: Icon(
          //               widget.cancelButtonIcon ?? Icons.clear,
          //               size: 20.0,
          //             ),
          //             color: widget.cancelButtonColor ?? Colors.grey.shade100,
          //             textColor: widget.cancelButtonTextColor,
          //             onPressed: () {
          //               Navigator.pop(context, null);
          //             },
          //           ),
          //         ),
          //         ButtonTheme(
          //           shape: new RoundedRectangleBorder(
          //               borderRadius: new BorderRadius.circular(30.0)),
          //           height: 40.0,
          //           child: RaisedButton.icon(
          //             label: Text(widget.saveButtonText ?? 'Save'),
          //             icon: Icon(
          //               widget.saveButtonIcon ?? Icons.save,
          //               size: 20.0,
          //             ),
          //             color: widget.saveButtonColor ??
          //                 Theme.of(context).primaryColor,
          //             textColor: widget.saveButtonTextColor ?? Colors.white,
          //             onPressed: _localDataSourceWithState
          //                         .where((item) => item['checked'])
          //                         .length >
          //                     widget.maxLength
          //                 ? null
          //                 : () {
          //                     var selectedValuesObjectList =
          //                         _localDataSourceWithState
          //                             .where((item) => item['checked'])
          //                             .toList();
          //                     var selectedValues = [];
          //                     selectedValuesObjectList.forEach((item) {
          //                       selectedValues.add(item['value']);
          //                     });
          //                     Navigator.pop(context, selectedValues);
          //                   },
          //           ),
          //         )
          //       ]),
          // )
        ],
      ),
    );
  }

  Widget _currentlySelectedOptions() {
    List<Widget> selectedOptions = [];

    var selectedValuesObjectList =
        _localDataSourceWithState.where((item) => item['checked']).toList();
    var selectedValues = [];
    selectedValuesObjectList.forEach((item) {
      selectedValues.add(item['value']);
    });
    selectedValues.forEach((item) {
      var existingItem = _localDataSourceWithState
          .singleWhere((itm) => itm['value'] == item, orElse: () => null);
      selectedOptions.add(Chip(
        label: new Container(
          constraints: new BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 80.0),
          child: Text(existingItem['text'], overflow: TextOverflow.ellipsis),
        ),
        deleteButtonTooltipMessage:
            widget.deleteButtonTooltipText ?? 'Tap to delete this item',
        deleteIcon: widget.deleteIcon ?? Icon(Icons.cancel),
        deleteIconColor: widget.deleteIconColor ?? Colors.grey,
        onDeleted: () {
          existingItem['checked'] = false;
          setState(() {});
        },
      ));
    });
    return (selectedOptions.length > 0 && widget.isShowSelectedOptions == true)
        ? Container(
            padding: EdgeInsets.all(10.0),
            color: widget.selectedOptionsBoxColor ?? Colors.grey.shade400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  widget.selectedOptionsInfoText ??
                      'Currently selected ${selectedOptions.length} items (tap to remove)', // use languageService here
                  style: TextStyle(
                      color:
                          widget.selectedOptionsInfoTextColor ?? Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 8,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                          child: Wrap(
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 0.4, // gap between lines
                        alignment: WrapAlignment.start,
                        children: selectedOptions,
                      )),
                    )),
              ],
            ),
          )
        : new Container();
  }

  ListView _optionsList() {
    List<Widget> options = [];
    widget.isSelectAll
        ? options.add(ListTile(
            // title: Text(
            //   'Select All' ?? '',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            // ),
            title: Transform.translate(
              offset: Offset(-20.0, 0.0),
              child: Text('Select All' ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            leading: Transform.translate(
              offset: Offset(-5.0, 0.0),
              child: Icon(
                isSelectedAll
                    ? widget.checkedIcon ?? Icons.check_box
                    : widget.uncheckedIcon ?? Icons.check_box_outline_blank,
                color: AppColors.BLUE_BUTTON,
                size: 30,
              ),
            ),
            onTap: () {
              setState(() {
                isSelectedAll = !isSelectedAll;
              });
              _localDataSourceWithState.forEach((item) {
                item['checked'] = isSelectedAll;
              });
            }))
        : Container();
    _searchresult.forEach((item) {
      options.add(ListTile(
          title: Transform.translate(
            offset: Offset(-20.0, 0.0),
            child: Text(item['text'] ?? '', style: TextStyle(fontSize: 18)),
          ),
          leading: Transform.translate(
            offset: Offset(-5.0, 0.0),
            child: Icon(
              item['checked']
                  ? widget.checkedIcon ?? Icons.check_box
                  : widget.uncheckedIcon ?? Icons.check_box_outline_blank,
              color: AppColors.BLUE_BUTTON,
              size: 30,
            ),
          ),
          onTap: () {
            if (widget.isSelectAll == false) {
              for (int i = 0; i < _searchresult.length; i++) {
                _searchresult[i]['checked'] = false;
              }
            }
            item['checked'] = !item['checked'];
            setState(() {});
          }));
      // options.add(new Divider(height: 1.0));
    });

    return ListView(children: options);
  }

  Widget _buildSearchText() {
    return Container(
      color: widget.searchBoxColor ?? Theme.of(context).primaryColor,
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: TextField(
              controller: _controller,
              keyboardAppearance: Brightness.light,
              onChanged: searchOperation,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(12.0),
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                  ),
                  filled: true,
                  hintText: widget.searchBoxHintText ?? "Search...",
                  fillColor: widget.searchBoxFillColor ?? Colors.white,
                  suffix: SizedBox(
                      height: 25.0,
                      child: IconButton(
                        icon: widget.searchBoxIcon ?? Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          searchOperation('');
                        },
                        padding: EdgeInsets.all(0.0),
                        tooltip: widget.searchBoxToolTipText ?? 'Clear',
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  void searchOperation(String searchText) {
    _searchresult.clear();
    if (_isSearching != null &&
        searchText != null &&
        searchText.toString().trim() != '') {
      for (int i = 0; i < _localDataSourceWithState.length; i++) {
        String data =
            '${_localDataSourceWithState[i]['value']} ${_localDataSourceWithState[i]['text']}';
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          _searchresult.add(_localDataSourceWithState[i]);
        }
      }
    } else {
      _searchresult = List.from(_localDataSourceWithState);
    }
  }
}
