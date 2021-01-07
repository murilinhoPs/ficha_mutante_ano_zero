import 'package:flutter/material.dart';

class CircleMark extends StatefulWidget {
  CircleMark({Key key}) : super(key: key);

  @override
  _CircleMarkState createState() => _CircleMarkState();
}

class _CircleMarkState extends State<CircleMark> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => clicked = !clicked);
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        alignment: Alignment.center,
        child: clicked
            ? Container(
                width: 12.5,
                height: 12.5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              )
            : null,
      ),
    );
  }
}
