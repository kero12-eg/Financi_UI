import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:financi_ui/Features/Main/Home/Widgets/Carousl_slider.dart';
import 'package:financi_ui/Features/Main/Home/Widgets/GridViewContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Spacing(height: 19.h),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.pro),
                  radius: 30.r,
                ),
                Spacing(width: 11.w),
                Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Text("Welcome back", style: AppStyle.interw50012gray),
                    Text("Kirolos Emad", style: AppStyle.interw60018black),
                  ],
                ),
                Spacer(),
                Image.asset(AppAssets.Notification, width: 48.w, height: 48.h),
                Spacing(width: 24.w),
              ],
            ),
            Spacing(height: 24.h),
            CarouslSlider(),
            Spacing(height: 24.h),
            Expanded(child: Gridviewcontent()),
          ],
        ),
      ),
    );
  }
}
