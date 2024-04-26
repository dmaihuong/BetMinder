import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double kDefaultPadding = 16;
const Color kWhiteText = Colors.white;

const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(8));
const BorderRadius kSmallBorderRadius = BorderRadius.all(Radius.circular(12));

const String kFontFamily = 'Onset';

const Color kGreyColor = Color.fromRGBO(171, 171, 171, 1);
const Color kLightBackgroundColor = Color.fromRGBO(245, 245, 245, 1);
const Color kLightCardColor = Color.fromRGBO(255, 255, 255, 1);
const Color kGreyLightCardColor = Color.fromRGBO(112, 111, 110, 1);
const Color kAccentColor = Color.fromRGBO(125, 138, 253, 1);
const Color kPromptTextColor = Color.fromRGBO(39, 38, 38, 1);


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kLightBackgroundColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: kLightBackgroundColor,
        titleTextStyle: TextStyle(
            color: kPromptTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 1.2,
            fontFamily: kFontFamily)),
    dividerTheme: DividerThemeData(color: kPromptTextColor.withOpacity(0.2)),
    colorScheme: ColorScheme.fromSwatch(
        cardColor: kLightCardColor,
        backgroundColor: kLightBackgroundColor,
        brightness: Brightness.light,
        errorColor: const Color.fromRGBO(242, 83, 84, 1),
        accentColor: kAccentColor),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: kPromptTextColor,
          fontSize: 34,
          fontFamily: kFontFamily,
          height: 1.1,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
        color: kPromptTextColor,
        fontSize: 24,
        fontFamily: kFontFamily,
        fontWeight: FontWeight.w900,
      ),
      titleSmall: TextStyle(
        color: kPromptTextColor,
        fontSize: 20,
        fontFamily: kFontFamily,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
          color: kPromptTextColor,
          fontSize: 16,
          height: 1.4,
          fontFamily: kFontFamily,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          color: kPromptTextColor,
          fontSize: 16,
          height: 1.4,
          fontFamily: kFontFamily,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
        color: kPromptTextColor,
        fontSize: 12,
        height: 1,
        fontFamily: kFontFamily,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
