import 'package:act_hub/core/resources/manager_text_theme_light.dart';
import 'package:act_hub/core/theme/manager_dark_theme.dart';
import 'package:flutter/material.dart';

class ThemeService {
  ThemeMode getThemeMode() => ThemeMode.dark;

  ThemeData getThemeData() => managerDarkThemeData();
}
