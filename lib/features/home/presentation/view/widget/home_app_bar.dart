import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Text(
      ManagerStrings.actHub,
      style: getRegularTextStyle(
        fontSize: ManagerFontSize.s22,
        color: ManagerColors.primaryColor,
      ),
    ),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          ManagerAssets.search,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          ManagerAssets.notification,
        ),
      )
    ],
  );
}