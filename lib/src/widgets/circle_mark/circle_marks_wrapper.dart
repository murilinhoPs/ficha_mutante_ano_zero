import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_mark.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_mark_changed_notification.dart';
import 'package:flutter/material.dart';

class CircleMarksWrapper extends StatefulWidget {
  final int itemsCount;
  final String parentName;
  final double circleMarkMargin;
  final MainAxisAlignment mainAxisAlignment;

  const CircleMarksWrapper({
    Key? key,
    this.circleMarkMargin = 8.0,
    required this.itemsCount,
    required this.parentName,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  State<CircleMarksWrapper> createState() => _CircleMarksWrapperState();
}

class _CircleMarksWrapperState extends State<CircleMarksWrapper> {
  int selectedIndex = 0;

  late var hasClickedMarks = List<bool>.filled(widget.itemsCount, false);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      children: List.generate(
        widget.itemsCount,
        (index) => NotificationListener<CircleMarkChangedNotification>(
          onNotification: (notification) {
            hasClickedMarks[index] = notification.clicked;
            return true;
          },
          child: CircleMark(
            keySharedPrefs: '${widget.parentName}-$index',
            margin: widget.circleMarkMargin,
            canSave: canSave(index),
            onClickToSave: () {
              onSave(index);
            },
          ),
        ),
      ),
    );
  }

  bool canSave(int index) =>
      selectedIndex == index || selectedIndex - 1 == index;

  void onSave(int index) {
    if (canSave(index)) {
      hasClickedMarks[index]
          ? setState(() => selectedIndex--)
          : setState(() => selectedIndex++);
    }
  }
}
