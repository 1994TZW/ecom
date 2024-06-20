import '../bloc/setting_bloc.dart';
import '../helper/shared_pref.dart';

class ThemeModel {
  Future<ThemeOption> loadTheme() async {
    var data = await SharedPref.getTheme();
    var theme =
        data == ThemeOption.light.name ? ThemeOption.light : ThemeOption.dark;
    return theme;
  }

  ThemeOption changeTheme(ThemeOption theme) {
    SharedPref.saveTheme(theme.name);
    return theme;
  }
}
