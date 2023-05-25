import 'package:act_hub/config/constants.dart';
import 'package:act_hub/config/dependency_injection.dart';
import 'package:act_hub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: Constants.splashDuration), () {
      if (_appSettingsSharedPreferences.getOutBoardingViewed()) {
        Get.offAllNamed(
          Routes.loginView,
        );
      } else {
        Get.offAllNamed(
          Routes.outBoardingView,
        );
      }
    });
  }
}
