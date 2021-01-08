import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/circle_mark.dart';
import 'package:pdf_mutant/app/widgets/content_header.dart';
import 'package:pdf_mutant/app/widgets/small_input.dart';

class Atributes extends StatelessWidget {
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
          atributo(nome: 'Astúcia', efeito: 'Confuso'),
          atributo(nome: 'Empatia', efeito: 'Dúvida'),
        ],
      ),
    );
  }

  Widget atributo({@required String nome, @required String efeito}) {
    return Container(
      color: AppColors.orange,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SmallInput(keySharedPrefs: nome)
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.black,
            width: .4,
            height: 61,
          ),
          traumaAtribute(efeito, flex: 5)
        ],
      ),
    );
  }

  Widget traumaAtribute(String efeito, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            efeito,
            style: TextStyle(fontSize: 16.0),
          ),
          Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            direction: Axis.horizontal,
            children: [
              CircleMark(keySharedPrefs: efeito + '0'),
              CircleMark(keySharedPrefs: efeito + '1'),
              CircleMark(keySharedPrefs: efeito + '2'),
              CircleMark(keySharedPrefs: efeito + '3'),
            ],
          )
        ],
      ),
    );
  }
}
