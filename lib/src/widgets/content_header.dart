import 'package:flutter/material.dart';
import 'package:pdf_mutant/src/global/colors.dart';

class ContentHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final double fontSize;
  final double padding;

  const ContentHeader({
    @required this.title,
    this.iconBackground,
    this.iconColor,
    this.fontSize,
    this.padding,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBrown, AppColors.lightBrown],
          stops: [0.3, 0.95],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(padding ?? 8.0),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: fontSize ?? 28,
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
                    color: iconColor ?? Colors.black,
                  ),
                )
              : SizedBox(height: 0)
        ],
      ),
    );
  }
}
