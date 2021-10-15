import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  final Color iconBackground;
  final IconData? icon;
  final Color iconColor;
  final double fontSize;
  final double padding;
  final String title;

  const ContentHeader({
    Key? key,
    required this.title,
    this.iconBackground = Colors.transparent,
    this.iconColor = Colors.black,
    this.fontSize = 28.0,
    this.padding = 8.0,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkBrown,
            AppColors.lightBrown,
          ],
          stops: [0.3, 0.95],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          icon != null
              ? Container(
                  margin: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: iconBackground,
                  ),
                  padding: const EdgeInsets.all(7.0),
                  child: Icon(
                    icon,
                    size: 26.0,
                    color: iconColor,
                  ),
                )
              : SizedBox(height: 0)
        ],
      ),
    );
  }
}
