import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/widgets/will_pop_scope.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

Widget scaffoldWithBackgroundImage({
  required Widget child,
  Color backgroundColor = ManagerColors.primaryColor,
  String image = ManagerAssets.background,
  bool isRegisterView = false,
}) {
  return willPopScope(
    child: Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ManagerColors.transparent,
        elevation: Constants.elevation,
        leading: isRegisterView
            ? IconButton(
                onPressed: () {
                  Get.offAllNamed(Routes.loginView);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: ManagerColors.white,
                ),
              )
            : Container(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    ),
  );
}
