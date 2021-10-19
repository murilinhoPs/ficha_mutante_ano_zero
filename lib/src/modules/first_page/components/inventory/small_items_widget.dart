import 'package:ficha_mutante_ano_zero/src/widgets/notebook/notebook_with_title.dart';
import 'package:flutter/material.dart';

class SmallItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotebookWithTitle(
      sessionTitle: 'Itens Pequenos',
      hintText: 'Escreva seus itens...',
      notebookTitle: 'Lista de equipment',
      keyToSave: 'smallItemsKey',
    );
  }
}
