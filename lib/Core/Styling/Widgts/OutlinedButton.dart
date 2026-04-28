import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Outlinedbuttons extends StatelessWidget {
  const Outlinedbuttons({
    super.key,
    this.width,
    this.height,
    this.buttoncolor,
    this.textstyle,
    this.radius,
    required this.title,
    required this.onpressed,
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
    return OutlinedButton(
      onPressed: onpressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: buttoncolor ?? AppColor.whitecolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
        ),
        side: const BorderSide(color: AppColor.primaryColor),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        title,
        style: textstyle ??
            AppStyle.TextButtonstyle.copyWith(
              color: AppColor.primaryColor,
            ),
      ),
    );
  }
}
