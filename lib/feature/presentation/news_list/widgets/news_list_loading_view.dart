import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/theme/colors.dart';
import 'package:newsapp/widgets/shimmer.dart';

class NewsListLoadingView extends StatelessWidget {
  const NewsListLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16.h, left: 12.w, right: 12.w),
          padding: EdgeInsets.only(bottom: 22.h),
          decoration: BoxDecoration(color: ThemeColors.pcWhite, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBox(
                width: double.infinity,
                height: 156.h,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                child: ShimmerBox(width: 140.w, height: 20.h),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 16.h, bottom: 22.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShimmerBox(width: 100.w, height: 20.h),
                    ShimmerBox(width: 70.w, height: 20.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: ShimmerBox(width: double.infinity, height: 80.h),
              ),
            ],
          ),
        );
      }),
    );
  }
}
