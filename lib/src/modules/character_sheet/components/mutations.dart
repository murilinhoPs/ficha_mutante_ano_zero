import 'package:ficha_mutante_ano_zero/src/widgets/notebook/notebook_with_title.dart';
import 'package:flutter/material.dart';

class MutationNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotebookWithTitle(
      sessionTitle: 'Mutações',
      hintText: 'Escreva suas mutações ou anotações sobre',
      notebookTitle: 'Suas mutações ao longo do rpg',
      keyToSave: 'mutationsListKey',
    );
  }
}
