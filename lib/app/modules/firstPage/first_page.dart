import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/atributes.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/conditions/conditions.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/equipments/armor.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/name_basics.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/points.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/skills.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicInfos(),
        Atributes(),
        Conditions(),
        Skills(),
        Equipments(),
        Points(),
      ],
    );
  }
}
