import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final log = Logger('SharedPref');

class SharedPref {
  static final SharedPref instance = SharedPref._();
  SharedPref._();

  static Future<String?> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language');
  }

  static Future<void> saveLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', lang);
  }

  static Future<bool?> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('dark_mode_on');
  }

  static Future<void> saveStaffMode(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('dark_mode_on', darkMode);
  }
}
