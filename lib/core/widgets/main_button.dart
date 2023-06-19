import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:flutter/material.dart';

Widget mainButton({
  required Widget child,
  void Function()? onPress,
  ShapeBorder? shapeBorder,
  Color? color,
  double? minWidth,
  double? height,
  double? elevation,
  EdgeInsetsGeometry? padding,
}) {
  return MaterialButton(
    padding: padding,
    onPressed: onPress ?? () {},
    shape: shapeBorder ??
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          ManagerRadius.r12,
        )),
    color: color.onNull(),
    minWidth: minWidth.onNull(),
    height: height.onNull(),
    elevation: elevation ?? Constants.elevationButton,
    child: child,
  );
}
