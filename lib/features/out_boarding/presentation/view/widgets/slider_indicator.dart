import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/features/out_boarding/presentation/controller/out_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutBoardingController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w65),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ManagerRadius.r12),
            color: ManagerColors.grey),
        width: double.infinity,
        height: ManagerHeight.h4,
        child: Row(
          children: [
            ...List.generate(
              3,
              (index) => Expanded(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r12),
                    color: controller.currentPage == index
                        ? ManagerColors.primaryColor
                        : ManagerColors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
