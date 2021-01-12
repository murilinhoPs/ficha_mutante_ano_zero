import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/text_inputs/resizible_input.dart';

class Wounds extends StatefulWidget {
  @override
  _WoundsState createState() => _WoundsState();
}

class _WoundsState extends State<Wounds> {
  double _containerHeight = 100;

  changeHeight(name) {
    print('_containerHeight');

    setState(() {
      _containerHeight += 20;
    });

    print(_containerHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightOrange,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ferimentos Graves:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          ResizibleInput(
            hintText: 'Escreva seus ferimentos',
            keySharedPrefs: 'wounds',
          )
        ],
      ),
    );
  }
}
