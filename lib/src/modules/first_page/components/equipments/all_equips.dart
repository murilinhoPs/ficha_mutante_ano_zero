import 'package:flutter/material.dart';
import 'package:pdf_mutant/src/modules/first_page/components/equipments/armor.dart';
import 'package:pdf_mutant/src/modules/first_page/components/equipments/weapons.dart';

class AllEquipments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Weapons(),
        Armor(),
      ],
    );
  }
}
