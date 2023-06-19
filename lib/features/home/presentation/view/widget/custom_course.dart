import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:act_hub/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomCourse extends StatelessWidget {
  final void Function()? onTap;
  final int index;

  const CustomCourse({Key? key, this.onTap, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w10,
          ),
          width: double.infinity,
          height: ManagerHeight.h110,
          decoration: BoxDecoration(
            color: ManagerColors.white,
            borderRadius: BorderRadius.circular(
              ManagerRadius.r10,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                child: Image.network(
                  controller.popularCourses[index].attributeCourseModel!.avatar
                      .toString(),
                  width: ManagerWidth.w128,
                  height: ManagerHeight.h110,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: ManagerWidth.w10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w6,
                      vertical: ManagerHeight.h6,
                    ),
                    margin: EdgeInsets.only(
                      top: ManagerHeight.h6,
                    ),
                    decoration: BoxDecoration(
                      color: ManagerColors.backgroundCourses,
                      borderRadius: BorderRadius.circular(
                        ManagerRadius.r4,
                      ),
                    ),
                    child: Text(
                      ManagerStrings.design,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.primaryColor),
                    ),
                  ),
                  Text(
                    controller.popularCourses[index].attributeCourseModel!.title
                        .toString(),
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.black),
                  ),
                  SizedBox(
                    height: ManagerHeight.h10,
                  ),
                  Text(
                    controller.courseHoursFormat(index),
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(
                  top: ManagerHeight.h10,
                  right: ManagerWidth.w10,
                  bottom: ManagerHeight.h10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: SvgPicture.asset(
                        ManagerAssets.save,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(ManagerAssets.star),
                        Text(
                          ManagerStrings.rate,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}