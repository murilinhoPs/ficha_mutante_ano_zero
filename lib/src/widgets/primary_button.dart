import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onClick;
  final Color buttonColor;
  final Widget content;

  const PrimaryButton({
    Key? key,
    required this.onClick,
    required this.content,
    this.buttonColor = AppColors.lightTextOrange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor.withOpacity(0.74),
        elevation: 0.0,
      ),
      onPressed: onClick,
      child: content,
    );
  }
}
