part of 'setting_bloc.dart';

abstract class SettingEvent {
  const SettingEvent();
}

class SettingLoaded extends SettingEvent {}

class LanguageChanged extends SettingEvent {
  final String selectedLanguage;
  const LanguageChanged({required this.selectedLanguage});
}

class ThemeChanged extends SettingEvent {
  final ThemeOption theme;
  const ThemeChanged({required this.theme});
}
