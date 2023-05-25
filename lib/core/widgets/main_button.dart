import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:flutter/material.dart';

Widget MainButton({
  required Widget child,
  void Function()? onPress,
  ShapeBorder? shapeBorder,
  Color? color,
  double? minWidth,
  double? height,
  double? elevation,
}) {
  return MaterialButton(
    onPressed: onPress ?? () {},
    shape: shapeBorder ??
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          ManagerRadius.r12,
        )),
    color: color ?? ManagerColors.transparent,
    minWidth: minWidth ?? ManagerWidth.w16,
    height: height ?? ManagerHeight.h16,
    elevation: elevation ?? Constants.elevationButton,
    child: child,
  );
}
