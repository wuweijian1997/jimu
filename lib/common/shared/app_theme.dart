
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jimu/common/shared/index.dart';

class AppTheme {


  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final ThemeData theme = ThemeData(
    ///主题色
    primaryColor: AppColor.THEME_COLOR,
    canvasColor: AppColor.THEME_COLOR,
    ///文字主题
    textTheme: _textTheme,
    platform: TargetPlatform.iOS,
  );


  static final TextTheme _textTheme = TextTheme(
    headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0, color: Colors.white),
    caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0, color: Colors.white),
    headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0, color: Colors.white),
    subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0, color: Colors.white),
    overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0, color: Colors.white),
    bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0, color: Colors.white),
    subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0, color: Colors.white),
    bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0, color: Colors.white),
    headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0, color: Colors.white),
    button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0, color: Colors.white),
  );
}