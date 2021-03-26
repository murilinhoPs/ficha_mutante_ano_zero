import 'package:flutter/material.dart';
import 'package:pdf_mutant/src/global/services/local_db.dart';

class ResizibleInput extends StatefulWidget {
  final String hintText;
  final String keySharedPrefs;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const ResizibleInput({
    Key key,
    @required this.hintText,
    this.keySharedPrefs = "input-none",
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  _ResizibleInputState createState() => _ResizibleInputState();
}

class _ResizibleInputState extends State<ResizibleInput> {
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
    return LayoutBuilder(
      builder: (context, BoxConstraints size) {
        TextSpan text = TextSpan(
          text: controller.text,
        );

        TextPainter textPainter = TextPainter(
          text: text,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
        );
        textPainter.layout();

        int currentLines =
            (textPainter.height / textPainter.preferredLineHeight).ceil();

        int maxLines = 7;

        return TextField(
          controller: controller,
          onChanged: (_) => saveData(),
          maxLines: currentLines < maxLines ? null : maxLines,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.none,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            fontStyle: widget.fontStyle,
          ),
        );
      },
    );
  }
}
