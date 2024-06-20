import 'dart:ui';

typedef LocaleChangeCallback = void Function(Locale locale);

class Translation {
  static final Translation _translation = Translation._internal();

  factory Translation() {
    return _translation;
  }

  Translation._internal();

  final List<String> supportedLanguages = ["ไทย", "English"];

  final List<String> supportedLanguagesCodes = ["th", "en"];
  static Locale defaultLocale = const Locale("th");

  /// returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  /// function to be invoked when changing the language
  LocaleChangeCallback? onLocaleChanged;
}
