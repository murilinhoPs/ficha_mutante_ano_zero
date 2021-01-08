import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/circle_mark.dart';
import 'package:pdf_mutant/app/widgets/content_header.dart';
import 'package:pdf_mutant/app/widgets/large_input.dart';

class Conditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: double
                .infinity //put here the max height to which you need to resize the textbox
            ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: [
            ContentHeader(
              title: 'condições',
            ),
            BoxContainer(
              top: BorderSide(
                width: 1.2,
                color: AppColors.darkGrey,
              ),
              bottom: myDefaultBorder,
              child: conditionsGrid(),
            ),
            wounds()
          ],
        ),
      ),
    );
  }

  Widget conditionsGrid() {
    return Container(
      color: AppColors.orange,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 3.6,
        physics: NeverScrollableScrollPhysics(),
        children: [
          BoxContainer(
            bottom: myDefaultBorder,
            right: myDefaultBorder,
            child: condition('Faminto'),
          ),
          BoxContainer(
            bottom: myDefaultBorder,
            child: condition('Desitratado'),
          ),
          BoxContainer(
            right: myDefaultBorder,
            child: condition('Insone'),
          ),
          condition('Hipotérmico'),
        ],
      ),
    );
  }

  Widget condition(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          CircleMark(keySharedPrefs: name),
        ],
      ),
    );
  }

  Widget wounds() {
    return Container(
      height: 160,
      color: AppColors.lightOrange,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ferimentos Graves:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: LargeInput(
              hintText: 'Escreva seus ferimentos',
              maxLines: 5,
              keySharedPrefs: 'wounds',
            ),
          ),
        ],
      ),
    );
  }
}
