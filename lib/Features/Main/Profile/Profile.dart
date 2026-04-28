import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/PrimaryButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:financi_ui/Features/Main/Profile/Widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(AppRouter.Main);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Customtext(
          text: "My Profile",
          textstyle: AppStyle.interw60018black,
        ),
        centerTitle: true,
        actions: [Image.asset(AppAssets.Edit, width: 48.w, height: 48.h)],
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 137.w, vertical: 39.h),
            child: CircleAvatar(
              backgroundImage: AssetImage(AppAssets.pro),
              radius: 30.r,
            ),
          ),
          Spacing(height: 9.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              width: 337.w,
              height: 78.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Customtext(
                      text: "Full Name",
                      textstyle: AppStyle.interw50012gray.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Spacing(height: 16.h),
                    Customtext(
                      text: "Kirolos Emad",
                      textstyle: AppStyle.interw60018black.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacing(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              width: 337.w,
              height: 78.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Customtext(
                      text: "Email",
                      textstyle: AppStyle.interw50012gray.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Spacing(height: 16.h),
                    Customtext(
                      text: "madk5078@Gmail.com",
                      textstyle: AppStyle.interw60018black.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacing(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              width: 337.w,
              height: 78.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Customtext(
                      text: "Phone Number",
                      textstyle: AppStyle.interw50012gray.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Spacing(height: 16.h),
                    Customtext(
                      text: "01279914491",
                      textstyle: AppStyle.interw60018black.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacing(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              width: 337.w,
              height: 78.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Customtext(
                      text: "Address",
                      textstyle: AppStyle.interw50012gray.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    Spacing(height: 16.h),
                    Customtext(
                      text: "Cairo, Egypt",
                      textstyle: AppStyle.interw60018black.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Primarybutton(
              buttoncolor: Colors.red,
              title: "Logout",
              onpressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Logout"),
                    content: Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text("Logout"),
                        onPressed: () {
                          context.pushReplacementNamed(AppRouter.Onboarding);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
