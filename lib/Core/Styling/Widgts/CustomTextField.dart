import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    this.height,
    this.width,
    required this.HintText,
    this.radius,
    this.suffixIcon,
    this.isPassword,
    this.controller,
    this.validator,
  });
  final double? height;
  final double? width;
  final String HintText;
  final double? radius;
  final IconButton? suffixIcon;
  final bool? isPassword;
  final TextEditingController? controller;
  // validator
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      height: height ?? 56.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          hintText: HintText,
          fillColor: AppColor.TextFieldColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 1.w),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          suffixIcon: suffixIcon,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
        ),
      ),
    );
  }
}
