import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/theme/text_styles.dart';

ThemeData appDefaultTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0061EF)),
    textTheme: const TextTheme().copyWith(
      bodyMedium: AdaptiveTextStyles.title3b.copyWith(fontWeight: FontWeight.w400, fontSize: 18),
    ),
    fontFamily: 'Figtree',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        textStyle: AdaptiveTextStyles.body,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    useMaterial3: true,
  );
}
