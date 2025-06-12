import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/text_styles_constant.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color.fromARGB(255, 245, 250, 255),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 76, 159, 226),
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: TextStyles.appBarTitle.copyWith(color: Colors.white),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 76, 159, 226),
      foregroundColor: Colors.white,
      elevation: 6,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyles.appBarTitle,
      bodyLarge: TextStyles.taskTitle,
      bodyMedium: TextStyles.taskDetails,
      titleMedium: TextStyles.popupMenuItem,
      titleSmall: TextStyles.errorMessage
          .copyWith(color: const Color.fromARGB(255, 247, 101, 99)),
      bodySmall: TextStyles.popupMenuItem,
    ),
    iconTheme: IconThemeData(
      color: Color.fromARGB(255, 76, 159, 226),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Color.fromARGB(255, 76, 159, 226)),
      checkColor: WidgetStateProperty.all(Colors.white),
      side: WidgetStateBorderSide.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
                color: Color.fromARGB(255, 99, 172, 233), width: 2);
          }
          return BorderSide(
              color: Color.fromARGB(255, 163, 205, 240), width: 2);
        },
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 76, 159, 226),
        foregroundColor: Colors.white,
        textStyle:
            GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 76, 159, 226),
        textStyle: GoogleFonts.manrope(fontWeight: FontWeight.w500),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: TextStyles.popupMenuItem,
      color: Color.fromARGB(255, 245, 250, 255),
      elevation: 4,
    ),
    colorScheme: ColorScheme.light(
      primary: Color.fromARGB(255, 76, 159, 226),
      secondary: Color.fromARGB(255, 163, 205, 240),
      surface: Color.fromARGB(255, 245, 250, 255),
      error: Colors.red[700]!,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Color.fromARGB(255, 230, 240, 250),
      textColor: Colors.black,
      iconColor: Color.fromARGB(255, 76, 159, 226),
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900]!,
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 76, 159, 226),
      foregroundColor: Colors.black,
      elevation: 4,
      titleTextStyle: TextStyles.appBarTitle.copyWith(color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 76, 159, 226),
      foregroundColor: Colors.white,
      elevation: 6,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyles.appBarTitle.copyWith(color: Colors.white),
      bodyLarge: TextStyles.taskTitle.copyWith(color: Colors.grey[200]!),
      bodyMedium: TextStyles.taskDetails.copyWith(color: Colors.grey[400]!),
      titleMedium: TextStyles.popupMenuItem.copyWith(color: Colors.grey[500]!),
      titleSmall: TextStyles.errorMessage
          .copyWith(color: const Color.fromARGB(255, 247, 101, 99)),
      bodySmall: TextStyles.popupMenuItem.copyWith(color: Colors.grey[300]!),
    ),
    iconTheme: IconThemeData(
      color: Color.fromARGB(255, 76, 159, 226),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Color.fromARGB(255, 76, 159, 226)),
      checkColor: WidgetStateProperty.all(Colors.white),
      side: WidgetStateBorderSide.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
                color: Color.fromARGB(255, 99, 172, 233), width: 2);
          }
          return BorderSide(
              color: Color.fromARGB(255, 163, 205, 240), width: 2);
        },
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 76, 159, 226),
        foregroundColor: Colors.white,
        textStyle:
            GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 76, 159, 226),
        textStyle: GoogleFonts.manrope(fontWeight: FontWeight.w500),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      textStyle: TextStyles.popupMenuItem.copyWith(color: Colors.grey[300]!),
      color: Colors.grey[850]!,
      elevation: 4,
    ),
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(255, 76, 159, 226),
      secondary: Color.fromARGB(255, 163, 205, 240),
      surface: Colors.grey[900]!,
      error: const Color.fromARGB(255, 247, 101, 99),
      onPrimary: Colors.white,
      onSecondary: Colors.grey[200]!,
      onSurface: Colors.grey[200]!,
      onError: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.grey[850]!,
      textColor: Colors.grey[200]!,
      iconColor: Color.fromARGB(255, 76, 159, 226),
    ),
  );
}
