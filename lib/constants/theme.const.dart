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
      labelMedium: _buttonText, //18px
      labelSmall: _textButtonText, //14px

      displayMedium: _headline2, //18px
      displaySmall: _headline3, //14px
      headlineMedium: _headline4, //16px
      headlineSmall: _headline5, //14px
      labelLarge: _headline5

      // headline6: _headline6, //20px
      // subtitle1: _subtitle1, //16px
      // subtitle2: _subtitle2, //13px
      // bodyText1: _bodyText1, //14px
      // bodyText2: _bodyText2, //14px //normal
      // button: _button, //14px
      // caption: _caption, //12px
      // overline: _overline, //10px
      );

  static const TextStyle _appTitle = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBlue,
    fontSize: 22,
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
    fontSize: 14,
  );

  static const TextStyle _headline2 = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static const TextStyle _headline3 = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const TextStyle _headline4 = TextStyle(
    fontFamily: "Poppins",
    color: AppColors.secondaryDimBlue,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle _headline5 = TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w300,
    fontSize: 14,
  );

  // static final TextStyle _headline6 = TextStyle(
  //   fontFamily: "Roboto",
  //   color: AppColors.textColor,
  //   fontWeight: FontWeight.w700,
  //   fontSize: 20.sp,
  // );

  // static final TextStyle _subtitle1 = TextStyle(
  //   fontFamily: "RedHatDisplay",
  //   color: AppColors.textColor,
  //   fontWeight: FontWeight.w500,
  //   fontSize: 16.sp,
  // );

  // static final TextStyle _subtitle2 = TextStyle(
  //   fontFamily: "RedHatDisplay",
  //   color: AppColors.textColor,
  //   fontWeight: FontWeight.w500,
  //   fontSize: 13.sp,
  // );

  // static final TextStyle _bodyText1 = TextStyle(
  //   fontFamily: "RedHatDisplay",
  //   color: AppColors.textColor,
  //   fontWeight: FontWeight.w700,
  //   fontSize: 14.sp,
  // );

  // static final TextStyle _bodyText2 = TextStyle(
  //   fontFamily: "RedHatDisplay",
  //   color: AppColors.textColor,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 14.sp,
  // );
}
