import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/equipments/armor.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/equipments/weapons.dart';

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
