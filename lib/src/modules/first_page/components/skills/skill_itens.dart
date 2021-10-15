import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/global/skills_list.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/primary_button.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/large_input.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/small_input.dart';
import 'package:flutter/material.dart';

class SkillItems extends StatefulWidget {
  final VoidCallback updateList;

  const SkillItems({
    Key? key,
    required this.updateList,
  }) : super(key: key);

  @override
  State<SkillItems> createState() => _SkillItemsState();
}

class _SkillItemsState extends State<SkillItems> {
  void onLoadList() async {
    final skillsPref =
        await LocalStorageWrapper.getStringList(SkillList.keyToSaveList);

    if (skillsPref != null) {
      SkillList.skills = skillsPref;
    }
  }

  void onCreateItem() {
    widget.updateList();
    setState(
      () => SkillList.skills.add('custom'),
    );

    LocalStorageWrapper.setListString(
      SkillList.keyToSaveList,
      SkillList.skills,
    );
  }

  @override
  void initState() {
    onLoadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: SkillList.skills.length,
      itemBuilder: (context, index) {
        if (index == SkillList.skills.length - 1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoxContainer(
                bottom: BorderSide(
                  width: 2,
                  color: AppColors.darkGrey.withOpacity(0.8),
                ),
                child: skillItem(SkillList.skills[index], index),
              ),
              SizedBox(height: 12.0),
              PrimaryButton(
                onClick: onCreateItem,
                content: Text('+'),
              ),
            ],
          );
        }

        return skillItem(SkillList.skills[index], index);
      },
    );
  }

  Widget skillItem(
    String nome,
    int index, {
    Color color = AppColors.orange,
  }) {
    return BoxContainer(
      top: BorderSide(
        width: 2,
        color: AppColors.darkGrey.withOpacity(0.8),
      ),
      child: Container(
        color: nome == 'custom' ? AppColors.lightOrange : AppColors.orange,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            nome == 'custom'
                ? LargeInput(
                    hintText: 'Escreva sua perícia ...',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    width: 200,
                    height: 35,
                    keySharedPrefs: 'custom-$index',
                  )
                : Text(
                    nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
            SmallInput(
              keySharedPrefs: nome,
              bgColor: nome == 'custom'
                  ? AppColors.lightTextOrange
                  : AppColors.textOrange,
            ),
          ],
        ),
      ),
    );
  }
}
