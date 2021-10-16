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
  final int inputLength;
  final Color bgColor;
  final EdgeInsets padding;
  final double fontSize;

  const SmallInput({
    Key? key,
    this.height = 35.0,
    this.width = 45,
    this.inputLength = 2,
    this.hintText = '',
    this.keySharedPrefs = 'input-none1',
    this.fontSize = 14,
    this.bgColor = AppColors.textOrange,
    this.hasBorder = true,
    this.padding = const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 12,
    ),
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
        style: TextStyle(
          fontSize: widget.fontSize,
        ),
        maxLength: widget.inputLength,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (_) => saveData(),
        onEditingComplete: saveData,
        cursorColor: AppColors.orangeAccent,
        decoration: InputDecoration(
          counterText: '',
          focusColor: AppColors.orangeAccent,
          contentPadding: widget.padding,
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
