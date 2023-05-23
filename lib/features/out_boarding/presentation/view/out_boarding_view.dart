import 'package:act_hub/core/resources/manager_assets.dart';

import 'package:act_hub/core/resources/manager_sizes.dart';

import 'package:act_hub/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w16, vertical: ManagerWidth.w20),
          child: Column(
            children: [
              const Align(
                alignment: AlignmentDirectional.topEnd,
                child: mainButton(),
              ),
              SizedBox(
                height: ManagerHeight.h86,
              ),
              SvgPicture.asset(
                ManagerAssets.outBoardingIllustration1,
                width: double.infinity,
                height: ManagerHeight.h206,
              )
            ],
          ),
        ),
      ),
    );
  }
}
