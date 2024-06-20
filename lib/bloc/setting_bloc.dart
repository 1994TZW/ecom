import 'package:ecom/model/setting_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({required this.settingModel}) : super(const SettingState()) {
    on<SettingLoaded>(onLoaded);
    on<LanguageChanged>(onChangeLanguage);
    on<ThemeChanged>(onChangeTheme);
  }

  final SettingModel settingModel;

  Future<void> onLoaded(SettingLoaded event, Emitter<SettingState> emit) async {
    String language = await settingModel.loadLanguage();
    ThemeOption? theme = await settingModel.loadTheme();
    emit(SettingState(selectedLanguage: language, themeOption: theme));
  }

  onChangeLanguage(LanguageChanged event, Emitter<SettingState> emit) {
    String language = settingModel.changeLanguage(event.selectedLanguage);
    emit(SettingState(
        selectedLanguage: language, themeOption: state.themeOption));
  }

  onChangeTheme(ThemeChanged event, Emitter<SettingState> emit) {
    ThemeOption themeOption = settingModel.changeTheme(event.theme);
    emit(SettingState(
        selectedLanguage: state.selectedLanguage, themeOption: themeOption));
  }
}
