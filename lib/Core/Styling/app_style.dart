import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle get Headlinestyle => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.MainFont,
        color: AppColor.primaryColor,
      );

  static TextStyle get Secondarylinestyle => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.MainFont,
        color: AppColor.secondaryColor,
      );

  static TextStyle get TextButtonstyle => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.MainFont,
        color: AppColor.whitecolor,
      );

  static TextStyle get interw50012gray => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.MainFont,
        color: AppColor.GrayHome,
      );

  static TextStyle get interw60018black => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.MainFont,
        color: AppColor.blackcolor,
      );
}
