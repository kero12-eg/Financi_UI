import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Chartbar extends StatelessWidget {
  const Chartbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pushReplacementNamed(AppRouter.Main);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          title: Text("Chart", style: AppStyle.interw60018black),
          centerTitle: true,
          actions: [Icon(Icons.more_horiz)],
        ),
        body: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Image.asset(AppAssets.Charts, width: 327.w, height: 236.h),
              Spacing(height: 16.h),
              Row(
                children: [
                  SizedBox(
                    width: 156.w,
                    height: 142.h,
                    child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Image.asset(AppAssets.send_money1),
                          Spacing(height: 12.h),
                          Text(
                            "15000 EG",
                            style: AppStyle.interw60018black.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          Spacing(height: 4.h),
                          Text(
                            "Income",
                            style: AppStyle.interw50012gray.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacing(width: 15.w),
                  SizedBox(
                    width: 156.w,
                    height: 142.h,
                    child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Image.asset(AppAssets.send_money2),
                          Spacing(height: 12.h),
                          Text(
                            "35000 EG",
                            style: AppStyle.interw60018black.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          Spacing(height: 4.h),
                          Text(
                            "Outcome",
                            style: AppStyle.interw50012gray.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
