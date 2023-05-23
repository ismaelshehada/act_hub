import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class mainButton extends StatelessWidget {
  const mainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Text(
        ManagerStrings.skip,
        style: getRegularTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.textColor),
      ),
    );
  }
}
