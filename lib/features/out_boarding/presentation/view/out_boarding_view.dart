import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';

import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/resources/manager_styles.dart';

import 'package:act_hub/core/widgets/main_button.dart';
import 'package:act_hub/features/out_boarding/presentation/controller/out_boarding_controller.dart';
import 'package:act_hub/features/out_boarding/presentation/view/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w16, vertical: ManagerWidth.w20),
          child: GetBuilder<OutBoardingController>(builder: (controller) {
            return Column(
              children: [
                Visibility(
                  visible: !controller.isLastPage(),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: mainButton(
                      onPress: () {
                        controller.skipPage();
                      },
                      child: Text(
                        ManagerStrings.skip,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.textColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: PageView(
                  controller: controller.pageController,
                  children: [
                    ...controller.pageViewItem,
                  ],
                  onPageChanged: (index) {
                    controller.setCurrentPage(index);
                  },
                )),
                Visibility(
                  visible: !controller.isLastPage(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: controller.showBackButton(),
                        child: circleButton(
                            opPressed: () {
                              controller.previousPage();
                            },
                            iconData: Icons.arrow_back_outlined),
                      ),
                      circleButton(
                          opPressed: () {
                            controller.nextPage();
                          },
                          iconData: Icons.arrow_forward_outlined)
                    ],
                  ),
                  replacement: mainButton(
                      onPress: () {
                        controller.getStart();
                      },
                      child: Text(
                        ManagerStrings.get_start,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.textColor),
                      ),
                      minWidth: double.infinity,
                      height: ManagerHeight.h40,
                      color: ManagerColors.primaryColor),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
