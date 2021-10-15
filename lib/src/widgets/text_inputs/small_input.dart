import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SmallInput extends StatefulWidget {
  final String keySharedPrefs;
  final String hintText;
  final bool hasBorder;
  final double height;
  final double width;
  final int inputLenght;
  final Color bgColor;

  const SmallInput({
    Key? key,
    this.height = 35.0,
    this.width = 45,
    this.inputLenght = 2,
    this.hintText = '',
    this.keySharedPrefs = 'input-none1',
    this.bgColor = AppColors.textOrange,
    this.hasBorder = true,
  }) : super(key: key);

  @override
  _SmallInputState createState() => _SmallInputState();
}

class _SmallInputState extends State<SmallInput> {
  final controller = TextEditingController();

  void initState() {
    getData();
    super.initState();
  }

  void saveData() async => await LocalStorageWrapper.setItemString(
        widget.keySharedPrefs,
        controller.text,
      );

  void getData() async {
    final prefTextInput =
        await LocalStorageWrapper.getItem(widget.keySharedPrefs);

    setState(() => controller.text = prefTextInput ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      color: widget.bgColor,
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 14),
        maxLength: widget.inputLenght,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (_) => saveData(),
        onEditingComplete: saveData,
        cursorColor: AppColors.orangeAccent,
        decoration: InputDecoration(
          counterText: '',
          focusColor: AppColors.orangeAccent,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 12,
          ),
          hintText: widget.hintText,
          border: widget.hasBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.black87),
                )
              : InputBorder.none,
        ),
      ),
    );
  }
}
