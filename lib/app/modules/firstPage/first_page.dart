import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/atributes.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/conditions.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/name_basics.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicInfos(),
        Atributes(),
        Conditions(),
      ],
    );
  }
}