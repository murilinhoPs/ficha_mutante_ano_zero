import 'package:flutter/material.dart';
import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_marks_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/content_header.dart';

class Points extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: Column(
        children: [
          pointSection('Pontos de Mutação'),
          pointSection('Pontos de Experiência'),
          pointSection('Pontos de Podridão'),
        ],
      ),
    );
  }

  Widget pointSection(String title) {
    return Column(
      children: [
        ContentHeader(title: title, fontSize: 24.0),
        Container(
          color: AppColors.orange,
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          child: CircleMarksWrapper(
            circleMarkMargin: 5.5,
            itemsCount: 10,
            parentName: title,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ),
      ],
    );
  }
}
