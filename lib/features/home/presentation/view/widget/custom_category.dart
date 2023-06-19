import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:act_hub/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CustomCategory extends StatelessWidget {
  final String name;
  final String imagePath;
  final int? index;

  const CustomCategory(
      {Key? key, required this.name, required this.imagePath, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.selectCategory(index!);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w6),
          margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w4),
          decoration: BoxDecoration(
            color: controller.selectedCategoryIndex == index
                ? ManagerColors.selectedCategory
                : ManagerColors.white,
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w4, vertical: ManagerHeight.h4),
                height: ManagerHeight.h40,
                width: ManagerWidth.w40,
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w4),
                decoration: BoxDecoration(
                  color: controller.selectedCategoryIndex == index
                      ? ManagerColors.white
                      : ManagerColors.backgroundCategory.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(ManagerRadius.r6),
                ),
                child: imagePath.isNotEmpty
                    ? Image.network(imagePath)
                    : SvgPicture.asset(ManagerAssets.office),
              ),
              SizedBox(
                width: ManagerWidth.w4,
              ),
              Text(
                name,
                style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s12,
                  color: controller.selectedCategoryIndex == index
                      ? ManagerColors.white
                      : ManagerColors.black,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
