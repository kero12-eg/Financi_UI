import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class colors {
  final Color? bgcolor;
  final Color? layercolor;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final Color? color4;
  final Color? color5;
  final Color? color6;
  const colors({
    this.bgcolor,
    this.layercolor,
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.color5,
    this.color6,
  });
}

class Content {
  final String? cardname;
  final String? balanceholder;
  final String? balance;
  final String? cardnumber;
  final String? date;
  const Content({
    this.cardname,
    this.balanceholder,
    this.balance,
    this.cardnumber,
    this.date,
  });
}

class size {
  final double? height;
  final double? width;
  const size({this.height, this.width});
}

class CustomContent extends StatelessWidget {
  const CustomContent({
    super.key,
    required this.c,
    required this.content,
    required this.cardsize,
    required this.space1,
    required this.space2,
    required this.space3,
    this.isactive,required this.layer1size,required this.layer2size,
  });
  final colors c;
  final Content content;
  final size cardsize;
  final size space1;
  final size space2;
  final size space3;
  final bool? isactive;
  final size layer1size;
  final size layer2size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardsize.width ?? 207.w,
      height: cardsize.height ?? 263.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: c.bgcolor ?? AppColor.primaryColor,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: layer1size.width ?? 207.w,
              height: layer1size.height ?? 190.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: c.layercolor ?? AppColor.primaryColor,
              ),
              child: Image.asset(AppAssets.layer1),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: layer2size.width ?? 153.w,
              height: layer2size.height ?? 110.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: c.layercolor ?? AppColor.primaryColor,
              ),
              child: Image.asset(AppAssets.layer2),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width:layer1size.width ?? 207.w,
              height:layer1size.height ?? 190.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: c.layercolor ?? AppColor.primaryColor,
              ),
              child: Image.asset(AppAssets.layer1),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width:layer2size.width ?? 153.w,
              height:layer2size.height ?? 110.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: c.layercolor ?? AppColor.primaryColor,
              ),
              child: Image.asset(AppAssets.layer2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.sp),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Text(
                      content.cardname ?? "X-Card",
                      style: AppStyle.interw50012gray.copyWith(
                        fontWeight: FontWeight.w700,
                        color: c.color1 ?? AppColor.whitecolor,
                      ),
                    ),
                    Spacer(),
                    isactive == true
                        ? Image.asset(AppAssets.visa)
                        : Container(),
                  ],
                ),
                Spacing(height: space1.height ?? 57.h),
                Text(
                  content.balanceholder ?? "Balance",
                  style: AppStyle.interw50012gray.copyWith(
                    fontSize: 14.sp,
                    color: c.color2 ?? AppColor.whitecolor.withOpacity(0.48),
                  ),
                ),
                Spacing(height: space2.height ?? 8.h),
                Text(
                  content.balance ?? "23400 EG",
                  style: AppStyle.Headlinestyle.copyWith(
                    fontSize: 24.sp,
                    color: c.color3 ?? AppColor.whitecolor,
                  ),
                ),
                Spacing(height: space3.height ?? 60.h),
                Row(
                  children: [
                    Text(
                      content.cardnumber ?? "**** 3434",
                      style: AppStyle.interw50012gray.copyWith(
                        fontSize: 14.sp,
                        color: c.color4 ?? AppColor.whitecolor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      content.date ?? "12/24",
                      style: AppStyle.interw50012gray.copyWith(
                        fontSize: 14.sp,
                        color: c.color5 ?? AppColor.whitecolor,
                      ),
                    ),
                    Spacing(width: 24.w),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
