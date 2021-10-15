import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/equipments/armor/armor_item.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/equipments/armor/armor_title.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:flutter/material.dart';

class ArmorInventory extends StatefulWidget {
  @override
  State<ArmorInventory> createState() => _ArmorInventoryState();
}

class _ArmorInventoryState extends State<ArmorInventory> {
  int armorItemsLength = 1;

  late var armorContentList = List<ArmorItem>.generate(
    armorItemsLength,
    (index) => ArmorItem(keyToSave: '$index'),
  );

  void onLoadList() async {
    for (var item in armorContentList) {
      final itemPref = await LocalStorageWrapper.getItem(item.keyToSave);

      if (itemPref != null) {
        armorContentList.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  ...armorContentList,
                  // PrimaryButton(
                  //   onClick: () {},
                  //   content: Text('+'),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
