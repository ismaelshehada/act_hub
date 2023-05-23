import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:act_hub/core/resources/manager_text_theme_dark.dart';
import 'package:flutter/material.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorDark,

    // this for disabled button colors
    disabledColor: ManagerColors.disabledColor,
    splashColor: ManagerColors.greyLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,

    /// APP BAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.greyLight,
      elevation: Constants.elevation,
      titleTextStyle: getBoldTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.primaryColor,
      ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLight,
      buttonColor: ManagerColors.buttonColorLight,
    ),

    textTheme: ManagerTextThemeDark(),
  );
}
