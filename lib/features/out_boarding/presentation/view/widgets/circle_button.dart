import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

Widget circleButton(
    {required void Function() opPressed, required IconData iconData}) {
  return mainButton(
      onPress: opPressed,
      child: Icon(
        iconData,
        color: ManagerColors.iconColor,
      ),
      shapeBorder: const CircleBorder(),
      minWidth: ManagerWidth.w50,
      height: ManagerHeight.h50,
      color: ManagerColors.primaryColor);
}
