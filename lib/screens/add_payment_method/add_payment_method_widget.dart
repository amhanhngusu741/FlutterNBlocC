import 'package:childcaresoftware/constants/color.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class InputWithLableOnTop extends StatelessWidget {
  final String title;
  final bool isRequired;
  const InputWithLableOnTop({Key key, this.title, this.isRequired})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _InputWithLableOnTop(title: title, isRequired: isRequired),
    );
  }
}

class _InputWithLableOnTop extends StatefulWidget {
  final String title;
  final bool isRequired;
  const _InputWithLableOnTop({Key key, this.title, this.isRequired})
      : super(key: key);

  @override
  _InputWithLableOnTopState createState() => _InputWithLableOnTopState();
}

class _InputWithLableOnTopState extends State<_InputWithLableOnTop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      // height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(color: Color.fromRGBO(235, 238, 241, 1), spreadRadius: 1),
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: AppColors.DEEP_GREY,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                widget.isRequired == true ? "*" : "",
                style: TextStyle(
                    color: AppColors.RED,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            child: TextFormField(
                // controller: valueController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  filled: true,
                  fillColor: AppColors.WHITE,
                  // hintText: hint,
                  enabledBorder: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      borderSide: new BorderSide(color: AppColors.PRIMARY)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    borderSide: BorderSide(width: 1, color: AppColors.BLACK),
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
        ],
      ),
    );
  }
}
