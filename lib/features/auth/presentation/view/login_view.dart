
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:act_hub/core/validator/validator.dart';
import 'package:act_hub/core/widgets/base_text_form_field.dart';
import 'package:act_hub/core/widgets/main_button.dart';
import 'package:act_hub/features/auth/presentation/controller/login_controller.dart';
import 'package:act_hub/features/auth/presentation/view/widget/auth_view.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  @override
  Widget build(BuildContext context) {
    return authView(
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  ManagerStrings.login,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s24,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: ManagerColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r4)),
                        ),
                        Text(
                          ManagerStrings.rememberMe,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                      ],
                    ),
                    mainButton(
                      child: Text(
                        ManagerStrings.forgotPassword,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h90),
                mainButton(
                    child: Text(
                      ManagerStrings.login,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.white,
                      ),
                    ),
                    minWidth: double.infinity,
                    color: ManagerColors.primaryColor,
                    height: ManagerHeight.h40,
                    onPress: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.login(context);
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.haveNotAccount,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.black),
                    ),
                    mainButton(
                        child: Text(
                          ManagerStrings.signUp,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        onPress: () {
                          Get.offAllNamed(Routes.registerView);
                        }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
