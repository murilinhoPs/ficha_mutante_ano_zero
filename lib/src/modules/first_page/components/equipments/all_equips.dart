import 'package:flutter/material.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/equipments/armor/armor_inventory.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/equipments/weapons.dart';

class AllEquipments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Weapons(),
        ArmorInventory(),
      ],
    );
  }
}
