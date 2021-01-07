import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/modules/firstPage/first_page.dart';

class AppWidget extends StatelessWidget {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mutant Pdf',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              FirstPage(),
              Container(color: Colors.lightBlue),
              Container(color: Colors.lightGreen)
            ],
          ),
        ),
      ),
    );
  }
}
