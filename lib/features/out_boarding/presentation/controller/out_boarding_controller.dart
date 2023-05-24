import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_strings.dart';
import 'package:act_hub/features/out_boarding/presentation/view/widgets/out_boarding_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OutBoardingController extends GetxController {
  late PageController pageController;

  static const firstPage = 0;
  int lastPage = 2;
  int currentPage = firstPage;

  List pageViewItem = <Widget>[
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration1,
      title: ManagerStrings.outBoardingTitle1,
      subTitle: ManagerStrings.outBoardingSubTitle1,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration2,
      title: ManagerStrings.outBoardingTitle2,
      subTitle: ManagerStrings.outBoardingSubTitle2,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration1,
      title: ManagerStrings.outBoardingTitle2,
      subTitle: ManagerStrings.outBoardingSubTitle2,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void setCurrentPage(int index) {
    currentPage = index;
    update();
  }

  void skipPage() {
    pageController.animateToPage(
      lastPage,
      duration: const Duration(seconds: Constants.outBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    currentPage = lastPage;
    update();
  }

  void nextPage() {
    if (currentPage < lastPage) {
      pageController.animateToPage(
        ++currentPage,
        duration: const Duration(seconds: Constants.outBoardingDurationTime),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      update();
    }
  }

  bool showBackButton() {
    return currentPage > firstPage && currentPage < lastPage;
  }

  bool isLastPage() {
    return currentPage == lastPage;
  }
}
