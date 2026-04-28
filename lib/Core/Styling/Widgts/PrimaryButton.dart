import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Primarybutton extends StatelessWidget {
  const Primarybutton({
    super.key,
    required this.title,
    required this.onpressed,
    this.width,
    this.height,
    this.buttoncolor,
    this.textstyle,
    this.radius,
  });
  final double? width;
  final double? height;
  final Color? buttoncolor;
  final TextStyle? textstyle;
  final double? radius;
  final String title;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor ?? AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(title, style: textstyle ?? AppStyle.TextButtonstyle),
    );
  }
}
