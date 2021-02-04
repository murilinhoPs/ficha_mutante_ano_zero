import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/modules/first_page/components/atributes.dart';
import 'package:pdf_mutant/app/modules/first_page/components/conditions/conditions.dart';
import 'package:pdf_mutant/app/modules/first_page/components/equipments/all_equips.dart';
import 'package:pdf_mutant/app/modules/first_page/components/name_basics.dart';
import 'package:pdf_mutant/app/modules/first_page/components/points.dart';
import 'package:pdf_mutant/app/modules/first_page/components/skills/skills.dart';

class first_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicInfos(),
        Atributes(),
        Conditions(),
        Skills(),
        AllEquipments(),
        Points(),
      ],
    );
  }
}
