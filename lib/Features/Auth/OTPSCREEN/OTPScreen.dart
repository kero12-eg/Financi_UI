import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/BackButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/PrimaryButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:financi_ui/Features/Auth/OTPSCREEN/OTPcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  PinInputController controller = PinInputController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    controller = PinInputController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Spacing(height: 12.h),
                Backbuttons(),
                Spacing(height: 28.h),
                Text('OTP Verification', style: AppStyle.Headlinestyle),
                Spacing(height: 10.h),
                Text(
                  'Enter the verification code we just sent on your email address.',
                  style: AppStyle.Secondarylinestyle,
                ),
                Spacing(height: 32.h),
                Otpcode(
                  controller: controller,
                  validator: (value) {
                    if (value!.length < 4) {
                      return 'Please enter a valid OTP';
                    }
                    return null;
                  },
                ),
                Spacing(height: 38.h),
                Primarybutton(
                  title: 'Verify',
                  onpressed: () {
                    if (formKey.currentState!.validate()) {
                      context.pushNamed(AppRouter.New_Password);
                    }
                  },
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Didn’t received code?",
                      style: AppStyle.TextButtonstyle.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Spacing(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRouter.otp);
                      },
                      child: Text(
                        " Resend",
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
