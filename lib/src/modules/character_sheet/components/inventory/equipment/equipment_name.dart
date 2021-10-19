import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/large_input.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/small_input.dart';
import 'package:flutter/material.dart';

class EquipmentName extends StatelessWidget {
  final String itemIndexName;
  final String placeholderText;
  final FontWeight fontWeight;
  final String keyToSave;
  final double fontSize;
  final bool isSmall;

  const EquipmentName({
    Key? key,
    required this.keyToSave,
    required this.itemIndexName,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.normal,
    this.placeholderText = 'nome do item...',
    this.isSmall = false,
  }) : super(key: key);

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
      child: Row(
        children: [
          Text(
            '$itemIndexName:',
            style: TextStyle(
              height: 3,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0),
            alignment: Alignment.centerLeft,
            child: isSmall
                ? SmallInput(
                    hasBorder: false,
                    hintText: placeholderText,
                    keySharedPrefs: 'itemName-$keyToSave',
                    width: 200,
                    bgColor: Colors.transparent,
                    height: 45,
                    inputLength: 3,
                    padding: EdgeInsets.zero,
                  )
                : LargeInput(
                    hintText: placeholderText,
                    width: 280.0,
                    keySharedPrefs: 'itemName-$keyToSave',
                    maxLines: 1,
                  ),
          ),
        ],
      ),
    );
  }
}
