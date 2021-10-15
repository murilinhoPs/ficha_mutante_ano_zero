import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:flutter/material.dart';

class LargeInput extends StatefulWidget {
  final double height;
  final double width;
  final int maxLines;
  final String hintText;
  final String keySharedPrefs;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const LargeInput({
    Key? key,
    required this.hintText,
    this.maxLines = 1,
    this.height = 50.0,
    this.width = 40.0,
    this.keySharedPrefs = "input-none",
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
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

  void saveData() async => await LocalStorageWrapper.setItemString(
        widget.keySharedPrefs,
        controller.text,
      );

  void getData() async {
    final prefTextInput = await LocalStorageWrapper.getItem(
      widget.keySharedPrefs,
    );

    setState(() => controller.text = prefTextInput ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: TextField(
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: widget.fontWeight,
          fontStyle: widget.fontStyle,
        ),
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
