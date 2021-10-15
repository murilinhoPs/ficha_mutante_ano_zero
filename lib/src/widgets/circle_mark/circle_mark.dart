import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/controller/circle_mark_controller.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/circle_mark/controller/circle_mark_controller_impl.dart';
import 'package:flutter/material.dart';

class CircleMark extends StatefulWidget {
  final double margin;
  final String keySharedPrefs;
  final bool canSave;
  final VoidCallback onClickToSave;

  const CircleMark({
    Key? key,
    required this.margin,
    required this.canSave,
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

    // LocalStorageWrapper.setItemBool(
    //   widget.keySharedPrefs,
    //   circleMarkController.hasClicked,
    // );
  }

  void getData() async {
    final prefBool = await LocalStorageWrapper.getItem(widget.keySharedPrefs);

    circleMarkController.onCircleMarkTapped(value: prefBool ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClickToSave();
        print(widget.canSave);

        if (widget.canSave) {
          saveDataOnClick();
        }
        //!widget.canSave ? widget.onClickCantSave : saveDataOnClick,
      },
      child: Container(
        margin: EdgeInsets.all(widget.margin),
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: AppColors.textOrange,
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
