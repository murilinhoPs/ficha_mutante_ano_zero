import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/conditions/wounds.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/circle_mark.dart';
import 'package:pdf_mutant/app/widgets/content_header.dart';

class Conditions extends StatefulWidget {
  @override
  _ConditionsState createState() => _ConditionsState();
}

class _ConditionsState extends State<Conditions> {
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
              child: conditionsGrid(context),
            ),
            Wounds(),
          ],
        ),
      ),
    );
  }

  Widget conditionsGrid(BuildContext context) {
    return Container(
      color: AppColors.orange,
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 6.6, //3.6,
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
}
