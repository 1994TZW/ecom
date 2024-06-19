import 'dart:async';
import 'package:flutter/material.dart';
import 'translation_data.dart';
import 'translation.dart';

class TranslationsDelegate extends LocalizationsDelegate<TranslationData> {
  final Locale newLocale;

  const TranslationsDelegate({required this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return Translation().supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<TranslationData> load(Locale locale) {
    return TranslationData.load(newLocale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TranslationData> old) {
    return true;
  }
}
