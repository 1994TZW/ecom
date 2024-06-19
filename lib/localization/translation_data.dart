import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TranslationData {
  Locale locale;
  static Map<dynamic, dynamic>? _localisedValues;

  TranslationData(this.locale);

  static TranslationData of(BuildContext context) {
    return Localizations.of<TranslationData>(context, TranslationData)!;
  }

  static Future<TranslationData> load(Locale locale) async {
    TranslationData appTranslations = TranslationData(locale);
    String jsonContent = await rootBundle
        .loadString("assets/local/${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String text(String key, {List<String>? translationVariables}) {
    String? value = _localisedValues![key];
    if (value == null) {
      return "$key not found";
    }
    if (translationVariables != null) {
      translationVariables.asMap().forEach((i, s) {
        value = value!.replaceAll("{$i}", s);
      });
    }
    return value!;
  }
}
