import 'package:comment_app/constants/colors.const.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.lightGrey,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightGrey,
      ),
      primaryColor: AppColors.primaryBlue,
      textTheme: textTheme,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ));

  static const TextTheme textTheme = TextTheme(
    displayLarge: _appTitle, //22px
    displayMedium: _circleText, //20px
    labelMedium: _buttonText, //18px
    labelSmall: _textButtonText, //16px
    bodyLarge: _blackBoldText, //16px
    bodyMedium: _greyItalicsText, //16px
    bodySmall: _regularText, //16px
  );

  static const TextStyle _appTitle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBlue,
    fontSize: 22,
  );

  static const TextStyle _circleText = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle _buttonText = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColors.white,
  );

  static const TextStyle _textButtonText = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBlue,
    fontSize: 16,
  );

  static const TextStyle _greyItalicsText = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontSize: 16,
    color: AppColors.darkGrey,
  );

  static const TextStyle _blackBoldText = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 16,
  );

  static const TextStyle _regularText = TextStyle(
    fontFamily: "Poppins",
    fontSize: 16,
  );
}
