import 'package:ecom/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/setting_bloc.dart';
import '../localization/translation.dart';
import '../widget/local_text.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  static final List<String> languagesList = Translation().supportedLanguages;
  static final List<String> languageCodesList =
      Translation().supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  @override
  Widget build(BuildContext context) {
    bool darkModeOn =
        context.watch<SettingBloc>().state.themeOption == ThemeOption.dark;

    return Drawer(
      child: BlocBuilder<SettingBloc, SettingState>(builder: (_, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset("assets/ecom_logo.png",
                          height: 60, filterQuality: FilterQuality.medium),
                    ),
                  ),
                  IconButton(
                      onPressed: () =>
                          _toggleTheme(context: context, state: state),
                      icon: state.themeOption == ThemeOption.light
                          ? const Icon(Icons.mode_night_rounded,
                              color: textColor)
                          : const Icon(Icons.sunny, color: darkTextColor))
                ],
              ),
            ),
            Divider(
              color: darkModeOn ? placeHolderColor : null,
            ),
            buildLanguageWidget(
                context: context, state: state, darkModeOn: darkModeOn)
          ],
        );
      }),
    );
  }

  Widget buildLanguageWidget(
      {required BuildContext context,
      required SettingState state,
      required bool darkModeOn}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.language_outlined,
            color: darkModeOn
                ? darkTextColor.withOpacity(0.5)
                : textColor.withOpacity(0.7),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: LocalText(context, "drawer.language.title",
                fontSize: 15.0, color: darkModeOn ? darkTextColor : textColor),
          ),
          Row(
            children: [
              state.selectedLanguage == "English"
                  ? Image.asset(
                      'assets/flag_us.png',
                      fit: BoxFit.fitWidth,
                      width: 25,
                    )
                  : Image.asset(
                      'assets/flag_th.png',
                      fit: BoxFit.fitWidth,
                      width: 25,
                    ),
              Container(
                  width: 100,
                  padding: const EdgeInsets.only(left: 15),
                  child: DropdownButton(
                      dropdownColor: darkModeOn
                          ? darkDrawerBackgroundColor
                          : backgroundColor,
                      value: state.selectedLanguage,
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: languagesList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Poppins",
                                  color:
                                      darkModeOn ? darkTextColor : textColor),
                            ));
                      }).toList(),
                      onChanged: _selectedDropdown)),
            ],
          )
        ],
      ),
    );
  }

  _toggleTheme({required BuildContext context, required SettingState state}) {
    ThemeOption theme = state.themeOption == ThemeOption.light
        ? ThemeOption.dark
        : ThemeOption.light;

    context.read<SettingBloc>().add(ThemeChanged(theme: theme));
    Navigator.pop(context);
  }

  _selectedDropdown(selected) {
    context
        .read<SettingBloc>()
        .add(LanguageChanged(selectedLanguage: selected));
  }
}
