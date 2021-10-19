import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/inventory/armor/armor_inventory.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/inventory/equipment/equipment.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/inventory/small_items_widget.dart';
import 'package:flutter/material.dart';

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EquipmentItems(),
        ArmorInventory(),
        // Weapons(),
        SmallItemsWidget(),
      ],
    );
  }
}
