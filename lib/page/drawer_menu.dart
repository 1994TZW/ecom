import 'package:ecom/widget/theme.dart';
import 'package:flutter/material.dart';

import '../localization/translation.dart';
import '../widget/local_text.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String? selectedLanguage;
  static final List<String> languagesList = Translation().supportedLanguages;
  static final List<String> languageCodesList =
      Translation().supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  @override
  void initState() {
    _buildLanguage();
    super.initState();
  }

  _buildLanguage() async {
    // var lan = await languageModel.load();
    // if (selectedLanguage != lan) {
    //   selectedLanguage = lan;
    // }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                    child: Image.asset("assets/logo.png",
                        height: 60, filterQuality: FilterQuality.medium),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.mode_night_rounded, color: textColor))
              ],
            ),
          ),
          const Divider(),
          buildLanguageWidget(
              text: 'drawer.language.title', context: context, isEng: true)
        ],
      ),
    );
  }

  Widget buildLanguageWidget(
      {required String text,
      required BuildContext context,
      required bool isEng}) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Image.asset('assets/language.jpg', fit: BoxFit.fitWidth, width: 25),
          const SizedBox(width: 10),
          Expanded(
            child: LocalText(context, text, fontSize: 15.0, color: textColor),
          ),
          Row(
            children: [
              isEng
                  ? Image.asset(
                      'assets/flag_us.jpg',
                      fit: BoxFit.fitWidth,
                      width: 25,
                    )
                  : Image.asset(
                      'assets/flag_th.jpg',
                      fit: BoxFit.fitWidth,
                      width: 25,
                    ),
              Container(
                  width: 100,
                  padding: const EdgeInsets.only(left: 15),
                  child: DropdownButton(
                      dropdownColor: backgroundColor,
                      value: selectedLanguage,
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: languagesList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 15, fontFamily: "Poppins"),
                            ));
                      }).toList(),
                      onChanged: _selectedDropdown)),
            ],
          )
        ],
      ),
    );
  }

  _selectedDropdown(selected) {
    // var languageModel = Provider.of<LanguageModel>(context, listen: false);
    // languageModel.saveLanguage(selected);
    setState(() {
      selectedLanguage = selected;
    });
  }
}
