import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

TextFormField baseTextFormField({
  required TextEditingController controller,
  String? hintText,
  TextInputType? keyboardType,
  bool? obscureText,
  validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    cursorColor: ManagerColors.primaryColor,
    obscureText: obscureText.onNull(),
    validator: validator,
    style: getRegularTextStyle(
        fontSize: ManagerFontSize.s16, color: ManagerColors.black),
    decoration: InputDecoration(
      filled: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h6,
      ),
      fillColor: ManagerColors.white,
      hintText: hintText.onNull(),
      hintStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
    ),
  );
}
