import 'package:act_hub/config/constants.dart';
import 'package:act_hub/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: Constants.splashDuration), () {
      Get.offAndToNamed(
        Routes.outBoardingView,
      );
    });
  }
}
