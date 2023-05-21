

import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class ManagerTextThemeLight extends TextTheme {


  @override
  TextStyle get displayMedium => getMediumTextStyle(
        fontSize: ManagerFontSize.s20,
        color: ManagerColors.textColor,
      );

  @override
  TextStyle get displaySmall => getBoldTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.textColor,
      );

  @override
  TextStyle get headlineMedium => getMediumTextStyle(
    fontSize: ManagerFontSize.s16,
    color: ManagerColors.textColor,
  );

  @override
  TextStyle get titleMedium => getMediumTextStyle(
    fontSize: ManagerFontSize.s14,
    color: ManagerColors.textColor,
  );

  @override
  TextStyle get boldLargeTitle => getMediumTextStyle(
    fontSize: ManagerFontSize.s16,
    color: ManagerColors.textColor,
  );
}
