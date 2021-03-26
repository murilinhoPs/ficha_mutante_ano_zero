import 'package:flutter/material.dart';
import 'package:pdf_mutant/src/global/colors.dart';
import 'package:pdf_mutant/src/widgets/box_container.dart';
import 'package:pdf_mutant/src/widgets/circle_mark.dart';
import 'package:pdf_mutant/src/widgets/content_header.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              10,
              (index) => CircleMark(
                keySharedPrefs: 'title+$index',
                margin: 5.0,
              ),
              growable: false,
            ),
          ),
        ),
      ],
    );
  }
}
