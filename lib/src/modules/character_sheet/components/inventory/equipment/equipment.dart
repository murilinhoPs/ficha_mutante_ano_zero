import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/inventory/equipment/equipment_name.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/buttons/add_primary_button.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/content_header.dart';
import 'package:flutter/material.dart';

const _itemsKeyToSave = 'itemsKeySave';

class EquipmentItems extends StatefulWidget {
  const EquipmentItems({Key? key}) : super(key: key);

  @override
  _EquipmentItemsState createState() => _EquipmentItemsState();
}

class _EquipmentItemsState extends State<EquipmentItems> {
  int itemsLength = 1;

  void onLoadList() async {
    final itemsPref = await LocalStorageWrapper.getItem(_itemsKeyToSave);

    if (itemsPref != null) {
      itemsLength = itemsPref;
    }
  }

  void onAddItem() {
    setState(() => itemsLength++);

    LocalStorageWrapper.setItemInt(
      _itemsKeyToSave,
      itemsLength,
    );
  }

  @override
  void initState() {
    onLoadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final armorItemsList = List<EquipmentName>.generate(
      itemsLength,
      (index) => EquipmentName(
        keyToSave: '$index',
        itemIndexName: '$index',
        placeholderText: 'nome da equipamento...',
      ),
    );

    return Material(
      color: AppColors.lightOrange,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContentHeader(
            title: 'Equipamento',
            icon: Icons.backpack,
            iconBackground: AppColors.darkGrey,
            iconColor: AppColors.lightTextOrange,
          ),
          ...armorItemsList,
          EquipmentName(
            isSmall: true,
            keyToSave: 'bullets',
            placeholderText: 'quantidade de balas',
            itemIndexName: 'Balas',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: AddPrimaryButon(
              onClick: onAddItem,
            ),
          ),
        ],
      ),
    );
  }
}
