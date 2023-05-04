import 'package:flutter/material.dart';

const kColorPrimary = Color(0XFF8E97FD);
const kColorLightYellow = Color(0XFFFFECCC);
const kColorLightGrey = Color(0XFFEBEAEC);
const kColorDarkGrey = Color(0xFF3F414E);

class PrimaryFont {
  static String fontFamily = 'HelveticaNeue';

  static TextStyle black(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w900);
  }

  static TextStyle bold(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w700);
  }

  static TextStyle medium(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w500);
  }

  static TextStyle light(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w300);
  }

  static TextStyle thin(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontSize: size, fontWeight: FontWeight.w100);
  }
}

extension GetOrientation on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension GetSize on BuildContext {
  Size get size => MediaQuery.of(this).size;
}
