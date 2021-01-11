import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/global/services/local_db.dart';

class CircleMark extends StatefulWidget {
  final String keySharedPrefs;
  final double margin;

  CircleMark({Key key, this.keySharedPrefs = "none", this.margin}) : super(key: key);

  @override
  _CircleMarkState createState() => _CircleMarkState();
}

class _CircleMarkState extends State<CircleMark> {
  bool clicked = false;

  void initState() {
    getData();
    super.initState();
  }

  void saveDataOnClick() async {
    setState(() => clicked = !clicked);

    await LocalDatabase.setItemBool(widget.keySharedPrefs, clicked);
  }

  void getData() async {
    final prefBool = await LocalDatabase.getItem(widget.keySharedPrefs);

    setState(() => clicked = prefBool ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: saveDataOnClick,
      child: Container(
        margin: EdgeInsets.all(widget.margin ?? 7.0),
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: AppColors.textOrange,
          borderRadius: BorderRadius.circular(50.0),
        ),
        alignment: Alignment.center,
        child: clicked
            ? Container(
                width: 12.5,
                height: 12.5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              )
            : null,
      ),
    );
  }
}
