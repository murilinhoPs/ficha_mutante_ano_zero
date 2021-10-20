import 'package:ficha_mutante_ano_zero/src/global/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class CircleMarkShimmer extends StatelessWidget {
  final double margin;

  const CircleMarkShimmer({
    Key? key,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.textOrange.withOpacity(0.8),
      highlightColor: AppColors.lightOrangeShimmer,
      period: Duration(milliseconds: 1200),
      child: Container(
        margin: EdgeInsets.all(margin),
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: AppColors.textOrange.withOpacity(0.8),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
