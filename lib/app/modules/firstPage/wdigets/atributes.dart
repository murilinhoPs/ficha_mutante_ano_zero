import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';
import 'package:pdf_mutant/app/widgets/trauma_mark.dart';

class Atributes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  'ATRIBUTOS',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.warning, size: 32.0),
              ),
            ],
          ),
          atributo(nome: 'Força', efeito: 'Dano'),
          atributo(nome: 'Agilidade', efeito: 'Fadiga'),
          atributo(nome: 'Astúcia', efeito: 'Confusão'),
          atributo(nome: 'Empatia', efeito: 'Dúvida'),
        ],
      ),
    );
  }

  Widget atributo({@required String nome, @required String efeito}) {
    return Container(
      color: Colors.orange[400],
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(nome),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 30.0,
                    width: 40.0,
                    color: Colors.white,
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.cyan,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: Colors.black87),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.black,
            width: .5,
            height: 61,
          ),
          traumaAtribute(efeito, flex: 5)
        ],
      ),
    );
  }

  Widget traumaAtribute(String efeito, {int flex = 1}) {
    return Expanded(
      flex: 5,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              efeito,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TraumaMark(),
                TraumaMark(),
                TraumaMark(),
                TraumaMark()
              ],
            ),
          )
        ],
      ),
    );
  }
}
