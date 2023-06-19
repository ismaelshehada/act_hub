import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:flutter/material.dart';

Checkbox customCheckbox({
  required bool state,
  required void Function(bool?) onChanged,
}) {
  return Checkbox(
    value: state,
    onChanged: onChanged,
    activeColor: ManagerColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        ManagerRadius.r4,
      ),
    ),
  );
}