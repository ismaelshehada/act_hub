import 'package:act_hub/core/theme/manager_dark_theme.dart';
import 'package:flutter/material.dart';

class ThemeService {
  ThemeMode getThemeMode() => ThemeMode.dark;

  ThemeData getThemeData() => managerDarkThemeData();
}
