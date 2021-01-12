import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/content_header.dart';
import 'package:pdf_mutant/app/widgets/text_inputs/input_title.dart';
import 'package:pdf_mutant/app/widgets/text_inputs/large_input.dart';
import 'package:pdf_mutant/app/widgets/text_inputs/small_input.dart';

class Equipments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          armorTitle(),
          BoxContainer(
            top: BorderSide(color: AppColors.darkGrey, width: 2.0),
            child: armorContent(),
          )
        ],
      ),
    );
  }

  Widget armorTitle() {
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
        customDivider(),
        SizedBox(
          width: 120,
          child: Container(
            height: 54,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            color: AppColors.lightBrown,
            child: InputTitle(
              'Proteção',
              fontSize: 22.0,
              fontColor: AppColors.lightTextOrange,
            ),
          ),
        ),
      ],
    );
  }

  Widget armorContent() {
    return Container(
      color: AppColors.lightOrange,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.0),
            alignment: Alignment.centerLeft,
            child: LargeInput(
              hintText: 'nome da armadura',
              width: 200.0,
              keySharedPrefs: 'armorName',
              maxLines: 1,
            ),
          ),
          Positioned(
            right: 120,
            child: customDivider(),
          ),
          Positioned(
            top: 5.3,
            right: 15,
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: SmallInput(
                keySharedPrefs: 'armorValue',
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

  Widget customDivider() {
    return Container(
      color: Colors.black,
      width: 2,
      height: 54,
    );
  }
}
