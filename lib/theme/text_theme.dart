import 'package:flutter/material.dart';

enum TextWeight {
  regular(FontWeight.w400),
  medium(FontWeight.w600),
  bold(FontWeight.w700);

  final FontWeight weightValue;
  const TextWeight(this.weightValue);
}

abstract class AppTextTheme extends TextTheme {
  static TextStyle textXs({required TextWeight weight, Color? color}) {
    return TextStyle(
        fontSize: 10, fontWeight: weight.weightValue, color: color);
  }

  static TextStyle text2Xs({required TextWeight weight, Color? color}) {
    return TextStyle(
      fontSize: 12,
      fontWeight: weight.weightValue,
      color: color,
    );
  }

  static TextStyle textSm({required TextWeight weight, Color? color}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: weight.weightValue,
      color: color,
    );
  }

  static TextStyle textBase({required TextWeight weight, Color? color}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: weight.weightValue,
      color: color,
    );
  }

  static TextStyle textLg({required TextWeight weight, Color? color}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: weight.weightValue,
      color: color,
    );
  }

  static TextStyle textXl({required TextWeight weight, Color? color}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: weight.weightValue,
      color: color,
    );
  }

  static TextStyle text2Xl({required TextWeight weight, Color? color}) {
    return TextStyle(
      fontSize: 32,
      fontWeight: weight.weightValue,
      color: color,
    );
  }

  static TextStyle text3Xl({required TextWeight weight, Color? color}) {
    return TextStyle(
      fontSize: 40,
      fontWeight: weight.weightValue,
      color: color,
    );
  }
}

// const textTheme = TextTheme(
//   displayLarge: TextStyle(
//       fontSize: 57,
//       fontWeight: FontWeight.w400,
//       height: 64 / 57,
//       letterSpacing: -.25),
//   displayMedium: TextStyle(
//     fontSize: 45,
//     fontWeight: FontWeight.w400,
//     height: 52 / 45,
//   ),
//   displaySmall: TextStyle(
//     fontSize: 36,
//     fontWeight: FontWeight.w400,
//     height: 44 / 36,
//   ),
//   headlineLarge: TextStyle(
//     fontSize: 32,
//     fontWeight: FontWeight.w500,
//     height: 40 / 32,
//   ),
//   headlineMedium: TextStyle(
//     fontSize: 28,
//     fontWeight: FontWeight.w500,
//     height: 36 / 28,
//   ),
//   headlineSmall: TextStyle(
//     fontSize: 24,
//     fontWeight: FontWeight.w500,
//     height: 32 / 24,
//   ),
//   titleLarge: TextStyle(
//     fontSize: 22,
//     fontWeight: FontWeight.w500,
//     height: 28 / 22,
//   ),
//   titleMedium: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 24 / 16,
//       letterSpacing: .15),
//   titleSmall: TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//     height: 20 / 14,
//     letterSpacing: .1,
//   ),
//   labelLarge: TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//     height: 20 / 14,
//     letterSpacing: .1,
//   ),
//   labelMedium: TextStyle(
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//     height: 16 / 12,
//     letterSpacing: .5,
//   ),
//   labelSmall: TextStyle(
//     fontSize: 11,
//     fontWeight: FontWeight.w500,
//     height: 16 / 11,
//     letterSpacing: .5,
//   ),
//   bodyLarge: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w400,
//     height: 24 / 16,
//     letterSpacing: .5,
//   ),
//   bodyMedium: TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//     height: 20 / 14,
//     letterSpacing: .25,
//   ),
//   bodySmall: TextStyle(
//     fontSize: 12,
//     fontWeight: FontWeight.w400,
//     height: 16 / 12,
//     letterSpacing: .4,
//   ),
// );
