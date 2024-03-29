import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/circle_mark_changed_notification.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/controller/circle_mark_controller.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/controller/circle_mark_controller_impl.dart';
import 'package:flutter/material.dart';

class CircleMark extends StatefulWidget {
  final bool canClick;
  final bool isEnabled;
  final double margin;
  final String keySharedPrefs;
  final VoidCallback onClickToSave;

  const CircleMark({
    Key? key,
    required this.margin,
    required this.canClick,
    required this.isEnabled,
    required this.keySharedPrefs,
    required this.onClickToSave,
  }) : super(key: key);

  @override
  _CircleMarkState createState() => _CircleMarkState();
}

class _CircleMarkState extends State<CircleMark> {
  CircleMarkController circleMarkController = CircleMarkControllerImpl();

  void initState() {
    getData();
    super.initState();
  }

  void saveDataOnClick() {
    circleMarkController.onCircleMarkTapped();
    CircleMarkChangedNotification(circleMarkController.hasClicked)
        .dispatch(context);

    LocalStorageWrapper.setItemBool(
      widget.keySharedPrefs,
      circleMarkController.hasClicked,
    );
  }

  void getData() async {
    final prefBool = await LocalStorageWrapper.getItem(widget.keySharedPrefs);

    circleMarkController.onCircleMarkTapped(value: prefBool ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.canClick) return;

        widget.onClickToSave();

        saveDataOnClick();
      },
      child: Container(
        margin: EdgeInsets.all(widget.margin),
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: widget.isEnabled
              ? AppColors.textOrange
              : Colors.black.withOpacity(0.54),
          borderRadius: BorderRadius.circular(50.0),
        ),
        alignment: Alignment.center,
        child: ValueListenableBuilder(
          valueListenable: circleMarkController.state.hasClicked,
          builder: (context, bool value, child) {
            return value
                ? Container(
                    width: 12.5,
                    height: 12.5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
