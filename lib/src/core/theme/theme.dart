import 'package:bloc_example/src/core/constants/border_radius.dart';
import 'package:bloc_example/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get darkTheme => ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.nightSky,
      ),
    ),
    scaffoldBackgroundColor: AppColors.nightSky,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.nightSky,
      onPrimary: AppColors.fragrantWand,
      secondary: AppColors.blackBeauty,
      onSecondary: AppColors.fragrantWand,
      onTertiary: AppColors.bluishGreen,
      error: AppColors.cherryRed,
    ),
    cardTheme: CardThemeData(
      color: AppColors.blackBeauty,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiuses.cardBorderRadius,
      ),
    ),
    hintColor: AppColors.fragrantWand,

    iconTheme: IconThemeData(color: AppColors.fragrantWand),
  
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
      backgroundColor: AppColors.blackBeauty,
        foregroundColor: AppColors.blackBeauty,
        side: BorderSide(
          color: AppColors.fragrantWand,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.fragrantWand),
      fillColor: AppColors.blackBeauty,
      filled: true,
      focusedErrorBorder:   OutlineInputBorder(

        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.cherryRed, width: 1.0),
      ) ,
      errorBorder:    OutlineInputBorder(

        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.cherryRed, width: 1.0),
      ) ,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.bluishGreen, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.fragrantWand, width: 1.0),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.fragrantWand),
      bodyMedium: TextStyle(color: AppColors.fragrantWand),
      bodySmall: TextStyle(color: AppColors.fragrantWand),
      displayLarge: TextStyle(fontSize: 27, color: AppColors.fragrantWand,
      
      ),
      displayMedium: TextStyle(fontSize: 20, color: AppColors.fragrantWand),
         displaySmall:    TextStyle(
        fontSize: 14,
        color: AppColorsLight.deepCharcoal,
      ),
    ),
  );

 static ThemeData get lightTheme => ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColorsLight.morningSky,
      ),
    ),
    scaffoldBackgroundColor: AppColorsLight.morningSky,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColorsLight.morningSky,
      onPrimary: AppColorsLight.deepCharcoal,
      secondary: AppColorsLight.pureWhite,
      onSecondary: AppColorsLight.deepCharcoal,
      onTertiary: AppColorsLight.freshGreen,
            error: AppColors.cherryRed,

    ),
    cardTheme: CardThemeData(
      color: AppColorsLight.pureWhite,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiuses.cardBorderRadius,
      ),
    ),
    hintColor: AppColorsLight.deepCharcoal,

    iconTheme: IconThemeData(color: AppColorsLight.deepCharcoal),
  
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColorsLight.pureWhite,
        foregroundColor: AppColorsLight.pureWhite,
        side: BorderSide(
          color: AppColorsLight.deepCharcoal,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColorsLight.deepCharcoal),
      fillColor: AppColorsLight.pureWhite,
      filled: true,
       focusedErrorBorder:   OutlineInputBorder(

        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.cherryRed, width: 1.0),
      ) ,
          errorBorder:    OutlineInputBorder(

        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColors.cherryRed, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColorsLight.freshGreen, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadiuses.textFieldBorderRadius,
        borderSide: BorderSide(color: AppColorsLight.deepCharcoal, width: 1.0),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColorsLight.deepCharcoal),
      bodyMedium: TextStyle(color: AppColorsLight.deepCharcoal),
      bodySmall: TextStyle(color: AppColorsLight.deepCharcoal),
      displayLarge: TextStyle(
        fontSize: 27,
        color: AppColorsLight.deepCharcoal,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        color: AppColorsLight.deepCharcoal,
      ),
      displaySmall:    TextStyle(
        fontSize: 14,
        color: AppColorsLight.deepCharcoal,
      ),
    ),
  );

}
