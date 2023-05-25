import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'slider_indicator.dart';

class OutBoardingItem extends StatelessWidget {
  String image;
  String title;
  String subTitle;

  OutBoardingItem(
      {super.key,
      required this.image,
      required this.subTitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ManagerHeight.h86,
        ),
        SvgPicture.asset(
          image,
          width: double.infinity,
          height: ManagerHeight.h206,
        ),
        SizedBox(
          height: ManagerHeight.h50,
        ),
        const SliderIndicator(),
        SizedBox(
          height: ManagerHeight.h50,
        ),
        Text(
          title,
          style: getBoldTextStyle(
              fontSize: ManagerFontSize.s34, color: ManagerColors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: ManagerHeight.h20,
        ),
        Text(
          subTitle,
          style: getTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.greyLight),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
