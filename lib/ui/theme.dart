import 'dart:ui';

import 'package:flutter/material.dart';

const Color c_blue = Color(0xFF4e5ae8);
const Color c_yellow = Color(0xffe7a95f);
const Color c_pink = Color(0xfff62a5d);
const Color white = Color(0xffe5e5e5);
const primaryClr = c_blue;
const Color c_darkGray = Color(0xFF121212);
const Color c_darkHeader = Color(0xFF424242);


class Themes {
  static final light =  ThemeData(
  primaryColor:primaryClr,
  brightness: Brightness.light
  );

  static final dark =  ThemeData(
  primaryColor:c_darkGray,
  brightness: Brightness.dark
  );
}