import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/input_title.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/large_input.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/text_inputs/small_input.dart';
import 'package:flutter/material.dart';

class BasicsInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightOrange,
      child: BoxContainer(
        top: myDefaultBorder,
        bottom: myDefaultBorder,
        child: Column(
          children: [
            nameAge(),
            BoxContainer(
              top: BorderSide(
                color: Colors.grey[700]!,
                width: 1.0,
              ),
              child: role(),
            ),
          ],
        ),
      ),
    );
  }

  Widget nameAge() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputTitle(
                  inputName: "Nome",
                ),
                LargeInput(
                  keySharedPrefs: 'name',
                  hintText: 'nome do personagem',
                  width: 150,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                InputTitle(
                  inputName: "Idade",
                ),
                Expanded(
                  child: SmallInput(
                    keySharedPrefs: 'age',
                    bgColor: Colors.transparent,
                    hasBorder: false,
                    width: 50.0,
                    height: 45.0,
                    hintText: '18..',
                    inputLength: 2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget role() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputTitle(
                  inputName: "Papel",
                ),
                LargeInput(
                  keySharedPrefs: 'role',
                  hintText: 'papel do personagem',
                  width: 150,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Image(
              image: AssetImage('assets/logo.png'),
              height: 40,
            ),
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }

  Widget inputTitle(
    String name, {
    double fontSize = 20.0,
  }) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
