import 'dart:ui';

import '../localization/translation.dart';
import '../shared_pref.dart';

class LanguageModel {
  static final List<String> languageCodesList =
      Translation().supportedLanguagesCodes;
  static final List<String> languagesList = Translation().supportedLanguages;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  Future<String> load() async {
    var data = await SharedPref.getLang();
    String result = languagesList[0]; // defalut to english
    if (data != null) {
      result = data;
    }
    Translation().onLocaleChanged!(Locale(languagesMap[result]));
    return result;
  }

  String saveLanguage(String language)  {
    Translation().onLocaleChanged!(Locale(languagesMap[language]));
    SharedPref.saveLang(language);
    return language;
  }
}
