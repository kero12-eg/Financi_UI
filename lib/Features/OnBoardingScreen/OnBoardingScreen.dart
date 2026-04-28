import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/OutlinedButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/PrimaryButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'Assets/images/onboarding.png',
              width: 375.w,
              height: 570.h,
              fit: BoxFit.cover,
            ),
            Spacing(height: 21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Primarybutton(
                title: "Login",
                onpressed: () {
                  context.pushNamed(AppRouter.Login);
                },
              ),
            ),
            Spacing(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Outlinedbuttons(
                title: "Register",
                onpressed: () {
                  context.pushNamed(AppRouter.Register);
                },
              ),
            ),
            SizedBox(height: 46.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(AppRouter.Main);
                },
                child: Text(
                  "Continue as guest",
                  maxLines: 1,
                  softWrap: false,
                  textAlign: TextAlign.center,
                  style: AppStyle.TextButtonstyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackcolor2,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
