

import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required Color color,
  required TextDecoration textDecoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: textDecoration,
  );
}

TextStyle getRegularTextStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration = TextDecoration.none}) {
  return _textStyle(
      fontSize: fontSize,
      fontFamily: ManagerFontsFamily.fontFamily,
      fontWeight: ManagerFontWight.regular,
      color: color,
      textDecoration: decoration);
}

TextStyle getMediumTextStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration = TextDecoration.none}) {
  return _textStyle(
      fontSize: fontSize,
      fontFamily: ManagerFontsFamily.fontFamily,
      fontWeight: ManagerFontWight.medium,
      color: color,
      textDecoration: decoration);
}

TextStyle getBoldTextStyle(
    {required double fontSize,
    required Color color,
    TextDecoration decoration = TextDecoration.none}) {
  return _textStyle(
      fontSize: fontSize,
      fontFamily: ManagerFontsFamily.fontFamily,
      fontWeight: ManagerFontWight.bold,
      color: color,
      textDecoration: decoration);
}
