import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ManagerAssets.background),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
