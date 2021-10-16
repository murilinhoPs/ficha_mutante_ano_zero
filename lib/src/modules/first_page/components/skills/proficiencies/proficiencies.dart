import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/modules/first_page/components/skills/proficiencies/proficiency_name.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/buttons/add_primary_button.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/content_header.dart';
import 'package:flutter/material.dart';

const _proficiencyKeyToSave = 'proficiencyKeySave';

class Proficiencies extends StatefulWidget {
  const Proficiencies({Key? key}) : super(key: key);

  @override
  _ProficienciesState createState() => _ProficienciesState();
}

class _ProficienciesState extends State<Proficiencies> {
  int proficienciesLength = 1;

  void onLoadList() async {
    final itemsPref = await LocalStorageWrapper.getItem(_proficiencyKeyToSave);

    if (itemsPref != null) {
      proficienciesLength = itemsPref;
    }
  }

  void onAddProficiency() {
    setState(() => proficienciesLength++);

    LocalStorageWrapper.setItemInt(
      _proficiencyKeyToSave,
      proficienciesLength,
    );
  }

  @override
  void initState() {
    onLoadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final armorItemsList = List<ProficiencyName>.generate(
      proficienciesLength,
          (index) => ProficiencyName(
        keyToSave: '$index',
      ),
    );

    return Material(
      color: AppColors.lightOrange,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContentHeader(
            title: 'Talentos',
            icon: Icons.task,
            iconBackground: AppColors.darkGrey,
            iconColor: AppColors.lightTextOrange,
          ),
          ...armorItemsList,
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: AddPrimaryButon(
              onClick: onAddProficiency,
            ),
          ),
        ],
      ),
    );
  }
}
