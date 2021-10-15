import 'package:flutter/material.dart';

const myDefaultBorder = BorderSide(
  color: Colors.black,
  width: 2.3,
  style: BorderStyle.solid,
);

class BoxContainer extends StatelessWidget {
  final Widget child;
  final BorderSide top;
  final BorderSide bottom;
  final BorderSide left;
  final BorderSide right;
  final BorderSide? all;

  const BoxContainer({
    Key? key,
    required this.child,
    this.top = BorderSide.none,
    this.bottom = BorderSide.none,
    this.left = BorderSide.none,
    this.right = BorderSide.none,
    this.all,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        border: Border(
          top: all ?? top,
          bottom: all ?? bottom,
          left: all ?? left,
          right: all ?? right,
        ),
      ),
    );
  }
}
