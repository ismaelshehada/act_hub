import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:act_hub/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

Widget dialogButton({void Function()? onPressed, required String? message}) {
  return mainButton(
    child: Text(
      message.onNull(),
      style: getMediumTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.white,
      ),
    ),
    onPress: () {
      onPressed;
    },
    color: ManagerColors.primaryColor,
    height: ManagerHeight.h40,
  );
}
