import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/resizible_input.dart';
import 'package:flutter/material.dart';

class BlankNotebookWidget extends StatelessWidget {
  final String keyToSave;
  final String hintText;
  final double fontSize;
  final String notebookTitle;
  final Color backgroundColor;

  const BlankNotebookWidget({
    Key? key,
    required this.keyToSave,
    required this.hintText,
    required this.notebookTitle,
    this.backgroundColor = AppColors.lightOrange,
    this.fontSize = 14.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$notebookTitle:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          ResizableInput(
            fontSize: fontSize,
            hintText: hintText,
            keySharedPrefs: keyToSave,
          ),
        ], // one ok rock
      ),
    );
  }
}
