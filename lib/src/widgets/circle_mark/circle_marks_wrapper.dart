import 'package:flutter/material.dart';
import 'package:pdf_mutant/src/widgets/circle_mark/circle_mark.dart';

class CircleMarksWrapper extends StatelessWidget {
  final int itemsCount;
  final String parentName;
  final double circleMarkMargin;
  final MainAxisAlignment mainAxisAlignment;

  const CircleMarksWrapper({
    Key key,
    this.circleMarkMargin = 8.0,
    @required this.itemsCount,
    @required this.parentName,
    @required this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: List.generate(itemsCount, (index) {
        return CircleMark(
          keySharedPrefs: '$parentName-$index',
          margin: circleMarkMargin ?? this,
        );
      }),
    );
  }
}
