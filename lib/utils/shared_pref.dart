import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  putString(String key, String value) async {}
  getString(String key) {}

  static const Has_LoggedIn_key = "has_user_logged_in";

  /// sets the value of the user has logged into the app
  static setUserHasLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Has_LoggedIn_key, value);
  }

  /// gets the value of user's logged in status
   static Future<bool> getHasUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    bool? value = prefs.getBool(Has_LoggedIn_key);

    if (value != null && value == true) {
      return true;
    } else {
      return false;
    }
  }
}
