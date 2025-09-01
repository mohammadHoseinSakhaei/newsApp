import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveWrapper extends StatelessWidget {
  final Widget child;

  const AdaptiveWrapper({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      enableScaleWH: () => true,
      minTextAdapt: true,
      enableScaleText: () => true,
      ensureScreenSize: true,
      child: child,
    );
  }
}
