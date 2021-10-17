import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/large_input.dart';
import 'package:flutter/material.dart';

class ProficiencyName extends StatelessWidget {
  final String placeholderText;
  final FontWeight fontWeight;
  final String keyToSave;
  final double fontSize;

  const ProficiencyName(
      {Key? key,
      required this.keyToSave,
      this.fontSize = 12.0,
      this.fontWeight = FontWeight.normal,
      this.placeholderText = 'nome do talento...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: AppColors.darkGrey.withOpacity(0.8),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 8.0),
        alignment: Alignment.centerLeft,
        child: LargeInput(
          hintText: placeholderText,
          width: 280.0,
          keySharedPrefs: 'proficiencyName-$keyToSave',
          maxLines: 1,
        ),
      ),
    );
  }
}
