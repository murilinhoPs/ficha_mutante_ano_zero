import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/mutations.dart';
import 'package:flutter/material.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/attributes.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/conditions/conditions.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/inventory/inventory.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/name_basics.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/points.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/skills/skills.dart';

class CharacterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicsInfo(),
        Attributes(),
        Conditions(),
        Skills(),
        Inventory(),
        MutationNotes(),
        Points(),
      ],
    );
  }
}
