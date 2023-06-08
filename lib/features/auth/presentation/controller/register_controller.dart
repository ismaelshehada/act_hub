import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/state_render/state_renderer.dart';
import 'package:act_hub/core/widgets/dialog_button.dart';
import 'package:act_hub/features/auth/domin/use_case/register_use_case.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../config/dependency_injection.dart';

class RegisterController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController fullName = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();

  late final RegisterUseCase _registerUseCase = instance<RegisterUseCase>();
  bool isAgreePolicy = false;

  changePolicyStatus(bool status) {
    isAgreePolicy = status;
    update();
  }

  void performRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (isAgreePolicy) {
        _register(context);
      }
    } else {
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: ManagerStrings.shouldAgreePolicy,
        title: ManagerStrings.error,
        retryAction: () {},
        child: dialogButton(
          message: ManagerStrings.ok,
          onPressed: () {
            Get.back();
          },
        ),
      );
    }
  }

  Future<void> _register(BuildContext context) async {
    dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpLoadingState,
        message: ManagerStrings.loading,
        title: '',
        retryAction: () {});
    (await _registerUseCase.execute(RegisterUseCaseInput(
      name: fullName.text,
      email: email.text,
      password: password.text,
      confirmationPassword: confirmPassword.text,
      phone: phone.text,
    )))
        .fold(
            (l) => {
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
                      child: dialogButton(
                          message: ManagerStrings.ok,
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                    retryAction: () {},
                  ),
                },
            (r) => {
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
                      child: dialogButton(
                          message: ManagerStrings.ok,
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                    retryAction: () {
                      Get.offAllNamed(Routes.homeView);
                    },
                  ),
                });
  }
}
