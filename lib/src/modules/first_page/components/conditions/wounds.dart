import 'package:ficha_mutante_ano_zero/src/widgets/notebook/blank_notebook_widget.dart';
import 'package:flutter/material.dart';

class Wounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlankNotebookWidget(
      notebookTitle: 'Ferimentos Graves',
      hintText: 'Escreva seus ferimentos...',
      keyToSave: 'wounds',
    );
  }
}
