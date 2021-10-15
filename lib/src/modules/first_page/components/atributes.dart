import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_marks_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/content_header.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/small_input.dart';
import 'package:flutter/material.dart';

class Attributes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ContentHeader(
            title: 'atributos',
            icon: Icons.warning_amber_sharp,
            iconBackground: AppColors.yellow,
          ),
          atributo(nome: 'Força', efeito: 'Dano'),
          atributo(nome: 'Agilidade', efeito: 'Fadiga'),
          atributo(nome: 'Astúcia', efeito: 'Confusão'),
          atributo(nome: 'Empatia', efeito: 'Dúvida'),
        ],
      ),
    );
  }

  Widget atributo({required String nome, required String efeito}) {
    return BoxContainer(
      top: BorderSide(width: 1.5),
      child: Container(
        color: AppColors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SmallInput(
                    keySharedPrefs: nome,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 6.0, right: 8.0),
              color: Colors.black,
              width: 1.4,
              height: 61,
            ),
            traumaAtribute(efeito, flex: 5)
          ],
        ),
      ),
    );
  }

  Widget traumaAtribute(String efeito, {int flex = 1}) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 65,
            child: Text(
              efeito,
              textWidthBasis: TextWidthBasis.parent,
            ),
          ),
          CircleMarksWrapper(
            itemsCount: 4,
            parentName: efeito,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
