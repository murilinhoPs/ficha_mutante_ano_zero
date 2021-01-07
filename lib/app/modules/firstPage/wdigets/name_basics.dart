import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';

class BasicInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent[100],
      child: BoxContainer(
        top: myDefaultBorder,
        bottom: myDefaultBorder,
        child: Column(
          children: [
            nameAge(),
            BoxContainer(
              top: BorderSide(color: Colors.grey[700], width: 1.0),
              child: role(),
            ),
          ],
        ),
      ),
    );
  }

  Widget nameAge() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                inputTitle("Nome"),
                customInput(100.0, "nome do personagem")
              ],
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                inputTitle("Idade"),
                customInput(50.0, 'Número'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget role() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                inputTitle("Papel"),
                customInput(100.0, "papel do personagem"),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("Mutant logo"),
          ),
        ],
      ),
    );
  }

  Widget inputTitle(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 22.0),
    );
  }

  Widget customInput(double width, String hintText) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      alignment: Alignment.centerRight,
      height: 50.0,
      width: width,
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
