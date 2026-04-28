import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/BackButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/PrimaryButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Passwordchanged extends StatefulWidget {
  const Passwordchanged({super.key});

  @override
  State<Passwordchanged> createState() => _PasswordchangedState();
}

class _PasswordchangedState extends State<Passwordchanged> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Backbuttons(),
        ),
        body: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 138.w),
              child: Image.asset(AppAssets.successmark),
            ),
            Spacing(height: 35.h),
            Text("Password Changed", style: AppStyle.Headlinestyle),
            Spacing(height: 8.h),
            SizedBox(
              width: 226.w,
              
              child: Text(
                "Your password has been changed successfully.",
                style: AppStyle.Secondarylinestyle,
                textAlign: .center,
              ),
            ),
            Spacing(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Primarybutton(
                title: "Back to Login",
                onpressed: () {
                  context.pushNamed(AppRouter.Login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
