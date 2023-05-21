import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    //MAIN COLORS APP
    primaryColor: ManagerColors.white,
    primaryColorLight: ManagerColors.primaryColorLight,

    splashColor: ManagerColors.greyLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColor,

    disabledColor: ManagerColors.textColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.greyLight,
      elevation: 0,
      titleTextStyle: getBoldTextStyle(
          fontSize: ManagerFontSize.s14, color: ManagerColors.primaryColor),
    ),
  );
}
