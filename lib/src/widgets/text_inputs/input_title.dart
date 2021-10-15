import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  final String inputName;
  final double fontSize;
  final Color? fontColor;

  const InputTitle({
    Key? key,
    required this.inputName,
    this.fontColor,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      inputName,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: fontColor ?? Theme.of(context).textTheme.bodyText1!.color,
      ),
    );
  }
}
