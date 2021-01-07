import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final Widget child;

  const BoxContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(color: Colors.black, width: 2.0),
        ),
      ),
      child: child,
    );
  }
}
