import 'package:flutter/material.dart';
import 'package:pdf_mutant/app/global/colors.dart';

class ContentHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconBackground;

  const ContentHeader({
    Key key,
    @required this.title,
    this.icon,
    this.iconBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBrown, AppColors.lightBrown],
          stops: [0.3, 0.9],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
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
                  ),
                )
              : SizedBox(height: 57.7, width: 57.7)
        ],
      ),
    );
  }
}
