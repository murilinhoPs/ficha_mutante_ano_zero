import 'package:ficha_mutante_ano_zero/src/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class AddPrimaryButon extends PrimaryButton {
  AddPrimaryButon({
    Key? key,
    required VoidCallback onClick,
  }) : super(
          key: key,
          onClick: onClick,
          content: Text(
            '+',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        );
}
