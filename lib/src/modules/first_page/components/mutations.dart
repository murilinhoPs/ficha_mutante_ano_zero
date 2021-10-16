import 'package:ficha_mutante_ano_zero/src/widgets/notebook/notebook_with_title.dart';

class MutationNotes extends NotebookWithTitle {
  MutationNotes()
      : super(
          sessionTitle: 'Mutações',
          hintText: 'Escreva suas mutações ou anotações sobre',
          notebookTitle: 'Suas mutações ao longo do rpg',
          keyToSave: 'mutationsListKey',
        );
}
