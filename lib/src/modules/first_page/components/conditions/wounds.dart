import 'package:ficha_mutante_ano_zero/src/widgets/notebook/blank_notebook_widget.dart';

class Wounds extends BlankNotebookWidget {
  Wounds()
      : super(
          notebookTitle: 'Ferimentos Graves',
          hintText: 'Escreva seus ferimentos...',
          keyToSave: 'wounds',
        );
}
