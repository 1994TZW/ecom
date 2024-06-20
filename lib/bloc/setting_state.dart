part of 'setting_bloc.dart';

enum ThemeOption { light, dark }

class SettingState {
  final String selectedLanguage;
  final ThemeOption themeOption;

  const SettingState({
    String? selectedLanguage,
    ThemeOption? themeOption,
  })  : selectedLanguage = selectedLanguage ?? "ไทย",
        themeOption = themeOption ?? ThemeOption.light;
}
