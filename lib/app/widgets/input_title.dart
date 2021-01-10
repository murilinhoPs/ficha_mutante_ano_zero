import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  final String inputName;
  final double fontSize;
  final Color fontColor;

  const InputTitle(
    this.inputName, {
    Key key,
    this.fontSize,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      inputName,
      style: TextStyle(
        fontSize: fontSize ?? 20.0,
        fontWeight: FontWeight.bold,
        color: fontColor ?? Theme.of(context).textTheme.bodyText1.color,
      ),
    );
  }
}
