import 'package:act_hub/core/resources/manager_assets.dart';
import 'package:act_hub/core/resources/manager_colors.dart';
import 'package:flutter/material.dart';

Widget scaffoldWithBackgroundImage(
    {required Widget child,
    Color backgroundColor = ManagerColors.white,
    String image = ManagerAssets.background}) {
  return Scaffold(
    backgroundColor: backgroundColor,
    body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child),
  );
}
