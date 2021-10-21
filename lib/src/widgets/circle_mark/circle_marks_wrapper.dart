import 'package:collection/collection.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_mark.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_mark_changed_notification.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_mark_shimmer.dart';
import 'package:flutter/material.dart';

enum PopulateClickedMarksState {
  loading,
  success,
  error,
}

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
  int selectedIndex = -1;

  late List<bool> hasClickedMarks = [];

  late final Future<PopulateClickedMarksState> clickedMarksState;

  @override
  void initState() {
    clickedMarksState = populateHasClickedMarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopulateClickedMarksState>(
      future: clickedMarksState,
      initialData: PopulateClickedMarksState.loading,
      builder: (context, AsyncSnapshot<PopulateClickedMarksState> snapshot) {
        if (snapshot.data == PopulateClickedMarksState.success) {
          return Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: hasClickedMarks.mapIndexed(
              (index, element) {
                return NotificationListener<CircleMarkChangedNotification>(
                  onNotification: (notification) {
                    hasClickedMarks[index] = notification.clicked;
                    return true;
                  },
                  child: CircleMark(
                    keySharedPrefs: '${widget.parentName}$index',
                    margin: widget.circleMarkMargin,
                    canClick: canClick(index),
                    isEnabled: isEnabled(index),
                    onClickToSave: () {
                      onSave(index);
                    },
                  ),
                );
              },
            ).toList(),
          );
        }

        if (snapshot.data == PopulateClickedMarksState.error) {
          return Text('ocorreu um erro');
        }

        return Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: List.generate(
            widget.itemsCount,
            (index) => CircleMarkShimmer(
              margin: widget.circleMarkMargin,
            ),
          ),
        );
      },
    );
  }

  Future<PopulateClickedMarksState> populateHasClickedMarks() async {
    for (var index = 0; index < widget.itemsCount; index++) {
      final prefBool = await LocalStorageWrapper.getItem(
        '${widget.parentName}$index',
      );

      hasClickedMarks.add(prefBool ?? false);

      if (hasClickedMarks[index]) {
        selectedIndex = index;
      }
    }

    // if (widget.parentName == 'Dano')
    //   print('${widget.parentName}-$selectedIndex-$hasClickedMarks');

    await Future.delayed(Duration(seconds: 3));

    if (hasClickedMarks.isNotEmpty) {
      return PopulateClickedMarksState.success;
    }
    return PopulateClickedMarksState.error;
  }

  bool canClick(int index) =>
      (selectedIndex == index || selectedIndex < index + 1) && isEnabled(index);

  bool isEnabled(int index) => index > 0 ? hasClickedMarks[index - 1] : true;

  void onSave(int index) {
    if (canClick(index)) {
      hasClickedMarks[index]
          ? selectedIndex <= -1
              ? setState(() => selectedIndex = -1)
              : setState(() => selectedIndex--)
          : setState(() => selectedIndex++);
    }
  }
}
