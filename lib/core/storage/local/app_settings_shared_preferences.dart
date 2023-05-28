import 'package:act_hub/config/constants.dart';
import 'package:act_hub/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setOutBoardingViewed() async {
    await _sharedPreferences.setBool(
        ConstantsPrefsKey.out_boarding_viewed, true);
  }

  bool getOutBoardingViewed() {
    return _sharedPreferences
        .getBool(ConstantsPrefsKey.out_boarding_viewed)
        .onNull();
  }

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.token, token);
  }

  String getToken() {
    return _sharedPreferences.getString(ConstantsPrefsKey.token).onNull();
  }
}
