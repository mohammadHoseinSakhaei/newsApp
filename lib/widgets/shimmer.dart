import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    this.borderRadius,
    required this.width,
    required this.height,
    this.margin,
  });

  final BorderRadius? borderRadius;
  final double width;

  final double height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeColors.shimmerGray,
      highlightColor: ThemeColors.gray1,
      child: Container(
        margin: margin,
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(14),
        ),
      ),
    );
  }
}
