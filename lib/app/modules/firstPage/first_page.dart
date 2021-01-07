import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf_mutant/app/modules/firstPage/wdigets/atributes.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45.0),
        child: Column(
          children: [
            Atributes(),
            Container(
              color: Colors.orangeAccent[100],
              margin: const EdgeInsets.only(top: 2.5),
              child: BoxContainer(
                child: Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(
                                  "Nome",
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15.0),
                                  alignment: Alignment.centerRight,
                                  height: 50.0,
                                  width: 100.0,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        hintText: 'Escreva aqui...',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Text(
                                  "Idade",
                                  style: TextStyle(fontSize: 22.0),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15.0),
                                  alignment: Alignment.centerRight,
                                  height: 50.0,
                                  width: 50.0,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        hintText: 'Número',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Papel",
                            style: TextStyle(fontSize: 22.0),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0),
                            alignment: Alignment.centerRight,
                            height: 50.0,
                            width: 100.0,
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  hintText: 'Escreva aqui...',
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Text("Mutant logo")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
