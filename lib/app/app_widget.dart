import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/modules/firstPage/first_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ficha Ma0',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    color: Colors.white10,
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      width: double.infinity,
                    ),
                  ),
                  FirstPage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
