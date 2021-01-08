import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/large_input.dart';

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
                inputTitle("Nome"),
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
                inputTitle("Idade"),
                LargeInput(
                  keySharedPrefs: 'age',
                  hintText: 'Número',
                  width: 45.0,
                ),
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
                inputTitle("Papel"),
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
            child: Text("Mutant logo"),
          ),
        ],
      ),
    );
  }

  Widget inputTitle(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 22.0),
    );
  }
}
