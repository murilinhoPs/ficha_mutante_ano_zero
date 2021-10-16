import 'package:ficha_mutante_ano_zero/src/widgets/notebook/notebook_with_title.dart';

class SmallItemsWidget extends NotebookWithTitle {
  SmallItemsWidget()
      : super(
          sessionTitle: 'Itens Pequenos',
          hintText: 'Escreva seus itens...',
          notebookTitle: 'Lista de equipment',
          keyToSave: 'smallItemsKey',
        );
}
