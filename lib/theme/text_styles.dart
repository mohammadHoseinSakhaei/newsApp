import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveTextStyles {
  static final TextStyle largeTitle = TextStyle(
    fontSize: 34.sp,
    height: (41 / 34).sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle title1 = TextStyle(
    fontSize: 28.sp,
    height: (34 / 28).sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle title2 = TextStyle(
    fontSize: 22.sp,
    height: (28 / 22).sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle title2b = TextStyle(
    fontSize: 22.sp,
    height: (28 / 22).sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle title3b = TextStyle(
    fontSize: 20.sp,
    height: (25 / 20).sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle title3r = TextStyle(
    fontSize: 20.sp,
    height: (25 / 20).sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle headline = TextStyle(
    fontSize: 17.sp,
    height: (22 / 17).sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle body = TextStyle(
    fontSize: 17.sp,
    height: (22 / 17).sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle bodyLarge = TextStyle(
    fontSize: 17.sp,
    height: (22 / 17).sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle caption1 = TextStyle(
    fontSize: 13.sp,
    height: (17 / 13).sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle caption2 = TextStyle(
    fontSize: 11.sp,
    height: (13 / 11).sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static final TextStyle subHead = TextStyle(
    fontSize: 15.sp,
    height: (20 / 15).sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static final TextStyle hyperLink = TextStyle(
    fontSize: 17.sp,
    height: (22 / 17).sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Figtree',
  );

  static TextStyle custom({
    String fontFamily = 'Figtree',
    required double size,
    required FontWeight weight,
    Color textColor = Colors.black,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size.sp,
      height: (size * 1.5 / size).sp,
      // or any other calculation you want
      fontWeight: weight,
      color: textColor,
    );
  }
}