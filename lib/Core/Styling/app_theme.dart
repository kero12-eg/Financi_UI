import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static  ThemeData lightcolor = ThemeData(
     primaryColor: AppColor.primaryColor,
     scaffoldBackgroundColor: Colors.white,
     textTheme:  TextTheme(
      titleLarge: AppStyle.Headlinestyle,
      titleMedium: AppStyle.Secondarylinestyle
     ),
     buttonTheme: ButtonThemeData(
       buttonColor: AppColor.primaryColor,
       disabledColor: AppColor.Greycolor,
       textTheme: ButtonTextTheme.primary
     )
  );
}