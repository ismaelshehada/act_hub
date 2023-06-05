import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setOutBoardingViewed() async {
    await _sharedPreferences.setBool(
        ConstantsPrefsKey.outBoardingViewed, true);
  }

  bool getOutBoardingViewed() {
    return _sharedPreferences
        .getBool(ConstantsPrefsKey.outBoardingViewed)
        .onNull();
  }

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.token, token);
  }

  Future<void> setEmail(String email) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.email, email);
  }

  Future<void> setPassword(String password) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.password, password);
  }

  String getToken() {
    return _sharedPreferences.getString(ConstantsPrefsKey.token).onNull();
  }

  String getEmail() {
    return _sharedPreferences.getString(ConstantsPrefsKey.email).onNull();
  }

  String getPassword() {
    return _sharedPreferences.getString(ConstantsPrefsKey.password).onNull();
  }
}
