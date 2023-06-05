import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:act_hub/core/validator/validator.dart';
import 'package:act_hub/core/widgets/base_text_form_field.dart';
import 'package:act_hub/core/widgets/main_button.dart';
import 'package:act_hub/core/widgets/scaffold_with_background_image.dart';
import 'package:act_hub/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  @override
  Widget build(BuildContext context) {
    return scaffoldWithBackgroundImage(
        child: Column(
      children: [
        Expanded(
          flex: Constants.loginFirstPartFlex,
          child: Container(
            child: Center(
              child: SvgPicture.asset(ManagerAssets.logo),
            ),
          ),
        ),
        Expanded(
          flex: Constants.loginSecondPartFlex,
          child: Container(
            decoration: BoxDecoration(
              color: ManagerColors.backgroundForm,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(ManagerRadius.r45)),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w16, vertical: ManagerHeight.h30),
            width: double.infinity,
            child: GetBuilder<LoginController>(builder: (controller) {
              return Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text(
                      ManagerStrings.login,
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s25,
                        color: ManagerColors.black,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h30),
                    baseTextFormField(
                      controller: controller.email,
                      hintText: ManagerStrings.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => _failedValidator.validateEmail(
                        value,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h16),
                    baseTextFormField(
                      controller: controller.password,
                      hintText: ManagerStrings.password,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) => _failedValidator.validatePassword(
                        value,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h80),
                    mainButton(
                        child: Text(
                          ManagerStrings.login,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.white),
                        ),
                        minWidth: double.infinity,
                        color: ManagerColors.primaryColor,
                        height: ManagerHeight.h40,
                        onPress: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.login(context);
                          }
                        })
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    ));
  }
}
