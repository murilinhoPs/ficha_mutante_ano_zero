import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:ficha_mutante_ano_zero/src/widgets/box_container.dart';
import 'package:flutter/material.dart';

class Weapons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: CustomPaint(
        foregroundPainter: LinesPainter(),
        child: Column(
          children: [
            BoxContainer(
              bottom: myDefaultBorder,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.darkBrown, AppColors.lightBrown],
                    stops: [0.3, 0.95],
                  ),
                ),
                height: 52.0,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 55.0,
                            width: 100,
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'ARMA',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            // margin: const EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: AppColors.darkGrey,
                            ),
                            padding: const EdgeInsets.all(7.0),
                            child: Icon(
                              Icons.add_moderator,
                              size: 22.0,
                              color: AppColors.lightTextOrange,
                            ),
                          )
                        ],
                      ),
                    ),
                    status(title: 'Bônus'),
                    status(title: 'Dano'),
                    status(title: 'Alcance'),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              // height: 156,
              width: double.infinity,
              color: AppColors.lightOrange,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Escrever as armas'),
                  Text('Escrever as armas'),
                  Text('Escrever as armas'),
                  Text('Escrever as armas'),
                  Text('Escrever as armas'),
                  Text('Escrever as armas'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget positionedBorder(double left, BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: left * (MediaQuery.of(context).size.width / 440),
      child: BoxContainer(
        right: myDefaultBorder,
        child: SizedBox(),
      ),
    );
  }

  Widget status({
    required String title,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 55.0,
        alignment: Alignment(-0.5, 0.5),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.lightTextOrange,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class LinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offset1 = 170 * (size.width / 426);
    final offset2 = 253.3 * (size.width / 424);
    final offset3 = 340.6 * (size.width / 430);

    final paintWhite = Paint()..color = Colors.transparent;
    var rrectWhite = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      Radius.zero,
    );

    canvas.drawRRect(rrectWhite, paintWhite);

    final paintverticalLines = Paint()..strokeWidth = 2.0;

    canvas.drawLine(
        Offset(offset1, 0), Offset(offset1, size.height), paintverticalLines);

    canvas.drawLine(
        Offset(offset2, 0), Offset(offset2, size.height), paintverticalLines);

    canvas.drawLine(
        Offset(offset3, 0), Offset(offset3, size.height), paintverticalLines);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
