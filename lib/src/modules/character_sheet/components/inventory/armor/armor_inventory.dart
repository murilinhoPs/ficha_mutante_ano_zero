import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/inventory/armor/armor_item.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/inventory/armor/armor_title.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/buttons/add_primary_button.dart';
import 'package:flutter/material.dart';

const _armorItemsKeyToSave = 'armorInventoryKey';

class ArmorInventory extends StatefulWidget {
  @override
  State<ArmorInventory> createState() => _ArmorInventoryState();
}

class _ArmorInventoryState extends State<ArmorInventory> {
  int armorItemsLength = 1;

  void onLoadList() async {
    final itemsPref = await LocalStorageWrapper.getItem(_armorItemsKeyToSave);

    if (itemsPref != null) {
      armorItemsLength = itemsPref;
    }
  }

  void onCreateArmor() {
    setState(() => armorItemsLength++);

    LocalStorageWrapper.setItemInt(
      _armorItemsKeyToSave,
      armorItemsLength,
    );
  }

  @override
  void initState() {
    onLoadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final armorItemsList = List<ArmorItem>.generate(
      armorItemsLength,
      (index) => ArmorItem(keyToSave: '$index'),
    );

    return Material(
      color: AppColors.lightOrange,
      child: BoxContainer(
        bottom: myDefaultBorder,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ArmorTitle(),
            BoxContainer(
              top: BorderSide(
                color: AppColors.darkGrey,
                width: 2.0,
              ),
              child: Column(
                children: [
                  ...armorItemsList,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: AddPrimaryButon(
                      onClick: onCreateArmor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
