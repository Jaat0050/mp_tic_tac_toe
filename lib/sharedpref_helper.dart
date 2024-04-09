
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance =
      SharedPreferencesHelper._ctor();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._ctor();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//-------------------------------------------------------------
  static void setFullName({required String fullName}) {
    _prefs.setString("fullName", fullName);
  }

  static String getFullName() {
    return _prefs.getString("fullName") ?? "";
  }


}

enum UserPref {
  AuthToken,
}
