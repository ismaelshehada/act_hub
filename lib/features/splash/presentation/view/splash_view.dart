import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_sizes.dart';
import 'package:act_hub/core/widgets/scaffold_with_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffoldWithBackgroundImage(
      child: Center(
        child: SvgPicture.asset(
          ManagerAssets.logo,
          width: ManagerWidth.w166,
        ),
      ),
    );
  }
}
