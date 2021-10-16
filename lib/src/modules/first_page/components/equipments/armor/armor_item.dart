import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/custom_vertical_divider.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/large_input.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/small_input.dart';
import 'package:flutter/material.dart';

class ArmorItem extends StatelessWidget {
  final String keyToSave;

  const ArmorItem({
    Key? key,
    required this.keyToSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightOrange,
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: AppColors.darkGrey.withOpacity(0.8),
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.0),
            alignment: Alignment.centerLeft,
            child: LargeInput(
              hintText: 'nome da armadura...',
              width: 200.0,
              keySharedPrefs: 'armorName-$keyToSave',
              maxLines: 1,
            ),
          ),
          Positioned(
            right: 120,
            bottom: 0,
            child: CustomVerticalDivider(),
          ),
          Positioned(
            top: 5.3,
            right: 15,
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: SmallInput(
                keySharedPrefs: 'armorValue-$keyToSave',
                hintText: '+1..',
                width: 60,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
