import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/services/local_db.dart';

class LargeInput extends StatefulWidget {
  final double height;
  final double width;
  final int maxLines;
  final String hintText;
  final String keySharedPrefs;

  const LargeInput({
    Key key,
    this.maxLines = 1,
    this.height = 50.0,
    this.width,
    @required this.hintText,
    this.keySharedPrefs = "input-none",
  }) : super(key: key);

  @override
  _LargeInputState createState() => _LargeInputState();
}

class _LargeInputState extends State<LargeInput> {
  final controller = TextEditingController();

  void initState() {
    getData();
    super.initState();
  }

  void saveData() async => await LocalDatabase.setItemString(
        widget.keySharedPrefs,
        controller.text,
      );

  void getData() async {
    final prefTextInput = await LocalDatabase.getItem(widget.keySharedPrefs);

    setState(() => controller.text = prefTextInput ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      alignment: Alignment.centerRight,
      height: widget.height,
      width: widget.width,
      child: TextField(
        style: TextStyle(fontSize: 18.0),
        controller: controller,
        onChanged: (_) => saveData(),
        onEditingComplete: saveData,
        maxLines: widget.maxLines,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
