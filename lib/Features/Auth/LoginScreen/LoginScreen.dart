import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/BackButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/CustomTextField.dart';
import 'package:financi_ui/Core/Styling/Widgts/PrimaryButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool ispassword = false;
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formkey,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Spacing(height: 12.h),
                Backbuttons(
                  onpressed: () {
                    context.pushReplacementNamed(AppRouter.Onboarding);
                  },
                ),
                Spacing(height: 28.h),
                SizedBox(
                  width: 280.w,
                  child: Text(
                    'Welcome back! Again!',
                    style: AppStyle.Headlinestyle,
                  ),
                ),

                Spacing(height: 32.h),
                Customtextfield(
                  HintText: 'Enter your email',
                  controller: Emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                Spacing(height: 15.h),
                Customtextfield(
                  HintText: 'Enter your password',
                  isPassword: ispassword,
                  controller: passwordcontroller,
                  validator: (value) {
                    if (passwordcontroller.text.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispassword = !ispassword;
                      });
                    },
                    icon: Icon(
                      ispassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                Spacing(height: 15.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => context.pushNamed(AppRouter.forget),

                    child: Text('Forgot Password?'),
                  ),
                ),
                Spacing(height: 30.h),
                Primarybutton(
                  title: "Login",
                  onpressed: () {
                    if (formkey.currentState!.validate()) {
                      context.pushNamed(AppRouter.Main);
                    }
                  },
                ),
                Spacing(height: 35.h),
                Align(alignment: .center, child: Text('Or Login with')),
                Spacing(height: 22.h),
                Row(
                  children: [
                    Image.asset(AppAssets.facebook, width: 105.w, height: 56.h),
                    Spacing(width: 8.w),
                    Image.asset(AppAssets.google, width: 105.w, height: 56.h),
                    Spacing(width: 8.w),
                    Image.asset(AppAssets.cib, width: 105.w, height: 56.h),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppStyle.TextButtonstyle.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Spacing(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRouter.Register);
                      },
                      child: Text(
                        'Register',
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
