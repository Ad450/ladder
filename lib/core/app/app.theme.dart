import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ladder/gen/colors.gen.dart';
import 'package:ladder/gen/fonts.gen.dart';

class AppTheme {
  ThemeData get materialLightTheme => ThemeData(
        colorScheme: const ColorScheme(
          primary: ColorName.primary,
          brightness: Brightness.light,
          onPrimary: ColorName.onBackground,
          secondary: ColorName.primary,
          onSecondary: ColorName.onBackground,
          error: ColorName.background,
          onError: Colors.red,
          background: ColorName.background,
          onBackground: ColorName.onBackground,
          surface: ColorName.background,
          onSurface: ColorName.onBackground,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: FontFamily.redHatDisplay,
            fontSize: 96,
            color: ColorName.onBackground,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            fontFamily: FontFamily.redHatDisplay,
            fontSize: 39,
            color: ColorName.onBackground,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            fontFamily: FontFamily.redHatDisplay,
            fontSize: 32,
            color: ColorName.onBackground,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontFamily: FontFamily.redHatDisplay,
            fontSize: 25,
            color: ColorName.onBackground,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.redHatDisplay,
            fontSize: 20,
            color: ColorName.onBackground,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontFamily: FontFamily.publicSans,
            fontSize: 16,
            color: ColorName.secondary,
            // fontWeight: FontWeight.normal,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll<Color>(ColorName.primary),
            foregroundColor: const MaterialStatePropertyAll<Color>(ColorName.background),
            textStyle: const MaterialStatePropertyAll<TextStyle>(
              TextStyle(
                fontSize: 18,
                fontFamily: FontFamily.publicSans,
                fontWeight: FontWeight.w500,
              ),
            ),
            side: const MaterialStatePropertyAll(
              BorderSide(style: BorderStyle.none),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            minimumSize: const MaterialStatePropertyAll<Size>(
              Size.fromHeight(54),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorName.textfield,
          // contentPadding: const EdgeInsets.symmetric(vertical: 40),

          hintStyle: const TextStyle(
            color: ColorName.hintColor,
            fontWeight: FontWeight.normal,
            fontFamily: FontFamily.publicSans,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      );
  ThemeData get materialDarkTheme => ThemeData();

  CupertinoThemeData get cupertinoLightTheme => const CupertinoThemeData(
        primaryColor: ColorName.primary,
        brightness: Brightness.light,
        primaryContrastingColor: ColorName.onBackground,
        barBackgroundColor: ColorName.background,
        scaffoldBackgroundColor: ColorName.onBackground,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: FontFamily.publicSans,
            fontSize: 16,
            color: ColorName.secondary,
            fontWeight: FontWeight.normal,
          ),
          navTitleTextStyle: TextStyle(
            fontFamily: FontFamily.redHatDisplay,
            fontSize: 39,
            color: ColorName.onBackground,
            fontWeight: FontWeight.w500,
          ),
          navLargeTitleTextStyle: TextStyle(
            fontFamily: FontFamily.redHatDisplay,
            fontSize: 96,
            color: ColorName.onBackground,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}

extension AppThemeExtension on BuildContext {
  ThemeData get appTheme => AppTheme().materialLightTheme;
}
