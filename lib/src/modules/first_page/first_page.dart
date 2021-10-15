import 'package:flutter/material.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/attributes.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/conditions/conditions.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/equipments/all_equips.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/name_basics.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/points.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/skills/skills.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicsInfo(),
        Attributes(),
        Conditions(),
        Skills(),
        AllEquipments(),
        Points(),
      ],
    );
  }
}
