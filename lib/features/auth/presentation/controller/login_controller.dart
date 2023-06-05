import 'package:act_hub/config/dependency_injection.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:act_hub/core/resources/manager_fonts.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/resources/manager_styles.dart';
import 'package:act_hub/core/state_render/state_renderer.dart';
import 'package:act_hub/core/widgets/main_button.dart';
import 'package:act_hub/features/auth/domin/use_case/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();

  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpLoadingState,
        message: ManagerStrings.loading,
        title: '',
        retryAction: () {});
    (await _loginUseCase.execute(LoginBaseUseCaseInput(
      email: email.text,
      password: password.text,
    ),) )
        .fold(
            (l) =>
        {
          Get.back(),
          dialogRender(
            context: context,
            stateRenderType: StateRenderType.popUpErrorState,
            message: l.message,
            title: '',
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w65,
              ),
              child: mainButton(
                child: Text(
                  ManagerStrings.ok,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.white,
                  ),
                ),
                onPress: () {
                  Get.back();
                },
                color: ManagerColors.primaryColor,
                height: ManagerHeight.h40,
              ),
            ),
            retryAction: () {},
          )
        },
            (r) =>
        {
          Get.back(),
          dialogRender(
            context: context,
            stateRenderType: StateRenderType.popUpSuccessState,
            message: ManagerStrings.thanks,
            title: '',
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w65,
              ),
              child: mainButton(
                child: Text(
                  ManagerStrings.ok,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.white,
                  ),
                ),
                onPress: () {
                  Get.back();
                },
                color: ManagerColors.primaryColor,
                height: ManagerHeight.h40,
              ),
            ),
            retryAction: () {},
          )
        });
  }

  @override
  void onClose() {
    email.dispose();
  }
}
