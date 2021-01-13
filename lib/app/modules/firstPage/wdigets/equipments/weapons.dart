import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';
import 'package:pdf_mutant/app/widgets/box_container.dart';

class Weapons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      bottom: myDefaultBorder,
      child: ConstrainedBox(
        // height: 210,
        constraints: BoxConstraints(minHeight: 100),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: BoxContainer(
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
                      status(title: 'Alcance', border: BorderSide.none),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 54,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                // height: 156,
                color: AppColors.lightOrange,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Escrever as armas'),
                    Text('Escrever as armas'),
                    Text('Escrever as armas'),
                  ],
                ),
              ),
            ),
            positionedBorder(165, context),
            positionedBorder(253.3, context),
            positionedBorder(343.6, context),
          ],
        ),
      ),
    );
  }

  Widget positionedBorder(double left, BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: left * (MediaQuery.of(context).size.width / 430),
      child: BoxContainer(
        right: myDefaultBorder,
        child: null,
      ),
    );
  }

  Widget status({@required String title, int flex, BorderSide border}) {
    return Expanded(
      flex: flex ?? 1,
      child: Container(
        height: 55.0,
        alignment: Alignment(0, 0.5),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.lightTextOrange,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
