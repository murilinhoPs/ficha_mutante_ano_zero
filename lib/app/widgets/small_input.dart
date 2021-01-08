import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/global/services/local_db.dart';

class SmallInput extends StatefulWidget {
  final double height;
  final double width;
  final String hintText;
  final String keySharedPrefs;
  final Color bgColor;

  const SmallInput({
    Key key,
    this.height = 35.0,
    this.width = 40,
    this.hintText = '',
    this.keySharedPrefs = 'input-none1',
    this.bgColor = AppColors.textOrange,
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

  void saveData() async => await LocalDatabase.setItemString(
        widget.keySharedPrefs,
        controller.text,
      );

  void getData() async {
    final prefTextInput = await LocalDatabase.getItem(widget.keySharedPrefs);

    setState(() => controller.text = prefTextInput ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      color: widget.bgColor,
      child: TextField(
        style: TextStyle(fontSize: 18.0),
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (_) => saveData(),
        onEditingComplete: saveData,
        cursorColor: AppColors.orangeAccent,
        decoration: InputDecoration(
          focusColor: AppColors.orangeAccent,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 15,
          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
