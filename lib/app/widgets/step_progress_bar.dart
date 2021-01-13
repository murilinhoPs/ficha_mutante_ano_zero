import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final double leftPadding;
  final double rightPadding;
  final bool isSeparated;
  final Color selectedColor;
  final Color unselectedColor;

  const StepProgressBar({
    Key key,
    @required this.totalSteps,
    @required this.currentStep,
    this.leftPadding = 35.0,
    this.rightPadding = 35.0,
    this.isSeparated = true,
    this.selectedColor = AppColors.orange,
    this.unselectedColor = AppColors.darkBrown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const double separatedWidth = 2.0;

    return Padding(
      padding: EdgeInsets.only(
          top: 10, left: leftPadding, right: rightPadding, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxHeight: 10, maxWidth: screenWidth),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: totalSteps,
          separatorBuilder: (context, index) =>
              SizedBox(width: isSeparated ? separatedWidth : 0.0),
          itemBuilder: (context, position) {
            return Container(
              width: (screenWidth - (leftPadding + rightPadding)) / totalSteps,
              decoration: BoxDecoration(
                color: AppColors.textOrange,
              ),
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: currentStep > position
                      ? selectedColor.withRed(255)
                      : unselectedColor.withOpacity(0.3),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
