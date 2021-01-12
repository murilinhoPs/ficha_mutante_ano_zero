import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/text_inputs/input_title.dart';
import 'package:pdf_mutant/app/widgets/text_inputs/large_input.dart';
import 'package:pdf_mutant/app/widgets/text_inputs/small_input.dart';

class BasicInfos extends StatelessWidget {
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
              top: BorderSide(color: Colors.grey[700], width: 1.0),
              child: role(),
            ),
          ],
        ),
      ),
    );
  }

  Widget nameAge() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                InputTitle("Nome"),
                SizedBox(width: 15),
                LargeInput(
                  keySharedPrefs: 'name',
                  hintText: 'nome do personagem',
                  width: 125,
                ),
              ],
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                InputTitle("Idade"),
                SizedBox(width: 10),
                SmallInput(
                  keySharedPrefs: 'age',
                  bgColor: Colors.transparent,
                  hasBorder: false,
                  width: 45.0,
                  height: 50.0,
                  hintText: '18',
                  inputLenght: 2,
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
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                InputTitle("Papel"),
                SizedBox(width: 15),
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
              height: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget inputTitle(String name, {double fontSize = 20.0, Color fontColor}) {
    return Text(
      name,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }
}
