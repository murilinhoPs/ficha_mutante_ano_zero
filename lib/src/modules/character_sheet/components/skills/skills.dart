import 'package:ficha_mutante_ano_zero/src/global/skills_list.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/skills/proficiencies/proficiencies.dart';
import 'package:flutter/material.dart';
import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/modules/character_sheet/components/skills/skill_itens.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/content_header.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  bool seeMore = true;
  bool changedListLength = false;

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: Column(
        children: [
          InkWell(
            hoverColor: Colors.red,
            onTap: () => setState(() => seeMore = !seeMore),
            child: Stack(
              children: [
                ContentHeader(
                  title: 'Perícias',
                  icon: Icons.dangerous,
                  iconBackground: AppColors.green,
                ),
                Positioned(
                  bottom: 10,
                  left: 54,
                  right: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        seeMore
                            ? Icons.arrow_circle_down_rounded
                            : Icons.arrow_circle_up_rounded,
                        color: AppColors.lightTextOrange,
                        size: 30,
                      ),
                      SizedBox(width: 2.5),
                      Text(
                        seeMore ? 'Ver +' : 'Ver -',
                        style: TextStyle(
                          color: AppColors.lightTextOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            color: AppColors.lightOrange,
            height: seeMore ? 95 : 52 * SkillList.skills.length.toDouble(),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutBack,
            child: SkillItems(
              updateList: () {
                setState(() => changedListLength = true);
              },
            ),
          ),
          Proficiencies(),
        ],
      ),
    );
  }
}
