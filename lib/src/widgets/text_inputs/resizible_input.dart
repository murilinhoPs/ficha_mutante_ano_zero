import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:flutter/material.dart';

class ResizableInput extends StatefulWidget {
  final String hintText;
  final String keySharedPrefs;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const ResizableInput({
    Key? key,
    required this.hintText,
    this.fontSize = 18.0,
    this.keySharedPrefs = "input-none",
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  _ResizableInputState createState() => _ResizableInputState();
}

class _ResizableInputState extends State<ResizableInput> {
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
          onEditingComplete: saveData,
          maxLines: currentLines < maxLines ? null : maxLines,
          cursorColor: Colors.black,
          textInputAction: TextInputAction.newline,
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
