import 'package:ecom/localization/translation_data.dart';
import 'package:ecom/widget/theme.dart';
import 'package:flutter/material.dart';

class LocalText extends Text {
  final BuildContext context;
  LocalText(this.context, String translationKey,
      {super.key,
      Color? color,
      double? fontSize,
      double? height,
      FontWeight? fontWeight,
      List<String>? translationVariables,
      String? text,
      bool underline = false,
      TextAlign? textAilgn = TextAlign.start,
      Paint? foreground})
      : super(
            text ??
                TranslationData.of(context).text(translationKey,
                    translationVariables: translationVariables),
            textAlign: textAilgn,
            style: newTextStyleEng(
                height: height,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                underline: underline,
                foreground: foreground)
            // style: Provider.of<LanguageModel>(context, listen: false).isEng
            //     ? newTextStyleEng(
            //         height: height,
            //         color: color,
            //         fontSize: fontSize,
            //         fontWeight: fontWeight,
            //         underline: underline,
            //         foreground: foreground)
            //     : newTextStyleThai(
            //         color: color,
            //         height: height,
            //         fontSize: fontSize,
            //         fontWeight: fontWeight,
            //         underline: underline,
            //         foreground: foreground)
            );
}
