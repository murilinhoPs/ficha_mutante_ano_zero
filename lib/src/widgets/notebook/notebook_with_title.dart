import 'package:ficha_mutante_ano_zero/src/widgets/content_header.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/notebook/blank_notebook_widget.dart';
import 'package:flutter/material.dart';

class NotebookWithTitle extends StatelessWidget {
  final String sessionTitle;
  final String keyToSave;
  final String hintText;
  final String notebookTitle;

  const NotebookWithTitle({
    Key? key,
    required this.sessionTitle,
    required this.keyToSave,
    required this.hintText,
    required this.notebookTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContentHeader(
          title: sessionTitle,
        ),
        BlankNotebookWidget(
          keyToSave: keyToSave,
          hintText: hintText,
          notebookTitle: notebookTitle,
        ),
      ],
    );
  }
}
