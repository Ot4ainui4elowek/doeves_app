import 'package:flutter/material.dart';

enum TextWeight {
  regular(FontWeight.w400),
  medium(FontWeight.w600),
  bold(FontWeight.w800);

  final FontWeight weightValue;
  const TextWeight(this.weightValue);
}

class AppTextTheme extends TextTheme {
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
