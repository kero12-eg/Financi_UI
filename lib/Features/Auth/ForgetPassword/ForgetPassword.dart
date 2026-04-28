import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/BackButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/CustomTextField.dart';
import 'package:financi_ui/Core/Styling/Widgts/PrimaryButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formkey,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Spacing(height: 12.h),
                Backbuttons(),
                Spacing(height: 28.h),
                Text("Forget Password?", style: AppStyle.Headlinestyle),
                Spacing(height: 10.h),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: AppStyle.Secondarylinestyle,
                ),
                Spacing(height: 32.h),
                Customtextfield(
                  HintText: "Enter your email",
                  width: 331.w,
                  height: 56.h,
                  radius: 8.r,
                  controller: email,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your email";
                    }
                    return null;
                  },
                ),
                Spacing(height: 38.h),
                Primarybutton(
                  title: "Send code",
                  onpressed: () {
                    if (_formkey.currentState!.validate()) {
                      context.pushNamed(AppRouter.otp);
                    }
                  },
                ),
                Spacer(),
                 Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        "Remember Password? ",
                        style: AppStyle.TextButtonstyle.copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Spacing(width: 5.w),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(AppRouter.Login);
                        },
                        child: Text(
                          'Login',
                          style: AppStyle.TextButtonstyle.copyWith(
                            color: AppColor.blackcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacing(height: 26.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
