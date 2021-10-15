import 'package:flutter/material.dart';

class CustomSnack extends SnackBar {
  final String message;

  CustomSnack({
    required this.message,
  }) : super(
          content: Text(message),
          padding: const EdgeInsets.all(5.0),
          backgroundColor: Colors.black87.withOpacity(0.75),
        );
}
