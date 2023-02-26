import 'dart:ui';

import 'package:first_mobile/ui/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

const MaterialColor c_blue = Colors.amber;
const MaterialColor c_yellow = Colors.yellow;
const Color c_pink = Color(0xfff62a5d);
const primaryClr = c_blue;
const Color c_darkHeader = Color(0xFF424242);
const Color darkHeader = Color.fromARGB(255, 255, 255, 255);




class Themes {
  static final light =  ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,
    brightness: Brightness.light),
    brightness: Brightness.light );

  static final dark =  ThemeData(
colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.black,
    brightness: Brightness.dark),
    brightness: Brightness.dark
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode? Colors.grey[400]:Colors.grey
    )
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato (
    textStyle: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
    )
  );
}