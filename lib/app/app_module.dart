import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/app_widget.dart';

class AppModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ficha Ma0',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: AppWidget(),
    );
  }
}
