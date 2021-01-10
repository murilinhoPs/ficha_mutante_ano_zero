import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/circle_mark.dart';
import 'package:pdf_mutant/app/widgets/content_header.dart';

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
        ContentHeader(title: title),
        Container(
          color: AppColors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              10,
              (index) => CircleMark(
                keySharedPrefs: 'title+$index',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
