import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/global/skills_list.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/content_header.dart';
import 'package:pdf_mutant/app/widgets/large_input.dart';
import 'package:pdf_mutant/app/widgets/small_input.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: Column(
        children: [
          ContentHeader(
            title: 'Perícias',
            icon: Icons.dangerous,
            iconBackground: AppColors.green,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: SkillList.skills.length,
            itemBuilder: (context, index) {
              return skillItem(SkillList.skills[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget skillItem(String nome, int index, {Color color = AppColors.orange}) {
    return BoxContainer(
      top: BorderSide(width: 1.5),
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
                    keySharedPrefs: nome + index.toString(),
                    hintText: 'Perícia de especialista',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    width: 200,
                    height: 35,
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
