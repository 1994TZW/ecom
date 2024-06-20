import 'package:flutter/material.dart';

const primaryColor = Color(0xff08489A);
const backgroundColor = Color(0xFFFFFFFF);
const cardBackgroundColor = Color(0xFFF5F8FB);
const textColor = Color(0xFF000000);
const lableColor = Color(0xFF8C8C8C);
var placeHolderColor = Colors.grey.withOpacity(0.2);

const darkBackgroundColor = Color(0xFF000000);
const darkTextColor = Color(0xFFFFFFFF);
var darkCardBackgroundColor = Colors.grey.withOpacity(0.2);
const darkDrawerBackgroundColor = Color(0xFF272727);
const darkPlaceholderColor = Color(0xff272727);

var placeholderGradient = LinearGradient(
  colors: [
    placeHolderColor,
    const Color.fromRGBO(148, 148, 148, 1),
   placeHolderColor,
  ],
  stops: const [
    0.1,
    0.3,
    0.4,
  ],
  begin: const Alignment(-1.0, -0.3),
  end: const Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

TextStyle newTextStyleEng(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    bool underline = false,
    Paint? foreground}) {
  return TextStyle(
      fontSize: fontSize ?? 13,
      height: height,
      color: foreground != null ? null : color ?? textColor,
      fontWeight: fontWeight,
      fontFamily: "Poppins",
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      foreground: foreground);
}

TextStyle newTextStyleThai(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool underline = false,
    TextOverflow? textOverflow,
    double? height,
    Paint? foreground}) {
  return TextStyle(
      height: height,
      overflow: textOverflow,
      wordSpacing: 0,
      fontSize: fontSize ?? 12,
      color: foreground != null ? null : color ?? textColor,
      fontWeight: fontWeight ?? FontWeight.w500,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontFamily: "NotoSansThai",
      foreground: foreground);
}

TextStyle darkThemeNewTextStyleEng(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    bool underline = false,
    Paint? foreground}) {
  return TextStyle(
      fontSize: fontSize ?? 13,
      height: height,
      color: foreground != null ? null : color ?? darkTextColor,
      fontWeight: fontWeight,
      fontFamily: "Poppins",
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      foreground: foreground);
}

TextStyle darkThemeNewTextStyleThai(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool underline = false,
    TextOverflow? textOverflow,
    double? height,
    Paint? foreground}) {
  return TextStyle(
      height: height,
      overflow: textOverflow,
      wordSpacing: 0,
      fontSize: fontSize ?? 12,
      color: foreground != null ? null : color ?? darkTextColor,
      fontWeight: fontWeight,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontFamily: "NotoSansThai",
      foreground: foreground);
}
