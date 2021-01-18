import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/modules/firstPage/widgets/atributes.dart';
import 'package:pdf_mutant/app/modules/firstPage/widgets/conditions/conditions.dart';
import 'package:pdf_mutant/app/modules/firstPage/widgets/equipments/all_equips.dart';
import 'package:pdf_mutant/app/modules/firstPage/widgets/name_basics.dart';
import 'package:pdf_mutant/app/modules/firstPage/widgets/points.dart';
import 'package:pdf_mutant/app/modules/firstPage/widgets/skills.dart';

class FirstPage extends StatelessWidget {
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
