import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/content_header.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/custom_vertical_divider.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/input_title.dart';
import 'package:flutter/material.dart';

class ArmorTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ContentHeader(
            title: 'Armadura',
            icon: Icons.add_moderator,
            iconBackground: AppColors.darkGrey,
            iconColor: AppColors.lightTextOrange,
          ),
        ),
        CustomVerticalDivider(),
        SizedBox(
          width: 120,
          child: Container(
            height: 54,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            color: AppColors.lightBrown,
            child: InputTitle(
              inputName: 'Proteção',
              fontSize: 18.0,
              fontColor: AppColors.lightTextOrange,
            ),
          ),
        ),
      ],
    );
  }
}
