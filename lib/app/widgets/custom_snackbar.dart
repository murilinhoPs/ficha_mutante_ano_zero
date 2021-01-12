import 'package:flutter/material.dart';

class CustomSnack extends SnackBar {
  static Widget build(BuildContext context, String message) {
    return SnackBar(
      padding: const EdgeInsets.all(5.0),
      content: Text(message),
      backgroundColor: Colors.black87.withOpacity(0.75),
    );
  }
}
