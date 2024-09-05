import 'package:flutter/material.dart';
import 'package:childcaresoftware/constants/color.dart';
import 'package:childcaresoftware/widgets/widgets.dart';

class AffiliationDialog extends StatefulWidget {
  final Function(dynamic) onSave;
  final dynamic item;

  const AffiliationDialog({Key key, this.onSave, this.item}) : super(key: key);

  @override
  _AffiliationDialogState createState() => _AffiliationDialogState();
}

class _AffiliationDialogState extends State<AffiliationDialog> {
  TextEditingController affiliate = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Add Affiliations',
          style: TextStyle(color: AppColors.PRIMARY, fontSize: 20),
        ),
      ),
      content: Container(
        // height: 00,
        // width: 300,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: affiliate,
                  decoration: InputDecoration(labelText: 'Affiliate'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Button(
                  width: 90,
                  label: 'Add',
                  height: 40,
                  onPress: () {
                    if (_formKey.currentState.validate()) {
                      widget.onSave({
                        'affiliate': affiliate.text,
                      });
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              Container(
                child: Button(
                  width: 90,
                  label: 'Cancel',
                  onPress: () => Navigator.of(context).pop(),
                  height: 40,
                  color: AppColors.RED,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
