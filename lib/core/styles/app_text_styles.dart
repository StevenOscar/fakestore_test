import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle heading1({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    double? fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 40,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle heading2({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 32,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle heading3({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle heading4({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle body1({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle body2({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle body3({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle body4({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  static TextStyle body5({
    required FontWeight fontWeight,
    Color? color,
    FontStyle? fontStyle,
    double? height,
    double? fontSize,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }
}
