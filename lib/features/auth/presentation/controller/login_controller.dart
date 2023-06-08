import 'package:act_hub/config/constants.dart';
import 'package:act_hub/config/dependency_injection.dart';
import 'package:act_hub/core/extensions/extensions.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/core/state_render/state_renderer.dart';
import 'package:act_hub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:act_hub/core/widgets/dialog_button.dart';
import 'package:act_hub/features/auth/domin/use_case/login_use_case.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  Future<void> login(BuildContext context) async {
    dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpLoadingState,
        message: ManagerStrings.loading,
        title: '',
        retryAction: () {});
    (await _loginUseCase.execute(
      LoginBaseUseCaseInput(email: email.text, password: password.text),
    ))
        .fold((l) {
      Get.back();
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
            onPressed: () {
              Get.back();
            },
            message: ManagerStrings.ok,
          ),
        ),
        retryAction: () {},
      );
    }, (r) {
      _appSettingsSharedPreferences.setEmail(email.text);
      _appSettingsSharedPreferences.setPassword(password.text);
      _appSettingsSharedPreferences.setToken(r.token.onNull());
      Get.back();
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
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.homeView);
            },
            message: ManagerStrings.ok,
          ),
        ),
        retryAction: () {},
      );
      Future.delayed(
          const Duration(
            seconds: Constants.loginTimer,
          ), () {
        Get.offAllNamed(Routes.homeView);
      });
    });
  }
}
