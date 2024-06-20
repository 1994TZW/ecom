import 'dart:ui';

import '../bloc/setting_bloc.dart';
import '../localization/translation.dart';
import '../helper/shared_pref.dart';

class SettingModel {
  static final List<String> languageCodesList =
      Translation().supportedLanguagesCodes;
  static final List<String> languagesList = Translation().supportedLanguages;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  Future<String> loadLanguage() async {
    var data = await SharedPref.getLanguage();
    String result = languagesList[0]; // defalut to thai
    if (data != null) {
      result = data;
    }
    Translation().onLocaleChanged!(Locale(languagesMap[result]));
    return result;
  }

  String changeLanguage(String language) {
    Translation().onLocaleChanged!(Locale(languagesMap[language]));
    SharedPref.saveLanguage(language);
    return language;
  }

  Future<ThemeOption?> loadTheme() async {
    var data = await SharedPref.getTheme();
    if (data == null) return null;
    var theme =
        data == ThemeOption.light.name ? ThemeOption.light : ThemeOption.dark;
    return theme;
  }

  ThemeOption changeTheme(ThemeOption theme) {
    SharedPref.saveTheme(theme.name);
    return theme;
  }
}
