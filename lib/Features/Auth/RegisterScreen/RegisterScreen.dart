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

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController ConfirmPasswordcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
    Emailcontroller = TextEditingController();
    Passwordcontroller = TextEditingController();
    ConfirmPasswordcontroller = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Form(
      key: formkey,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Spacing(height: 12.h),
              Backbuttons(onpressed: () {
                context.pop();
              },),
              Spacing(height: 28.h),
              Text(
                "Hello! Register to get started",
                style: AppStyle.Headlinestyle,
              ),
              Spacing(height: 32.h),
              Customtextfield(HintText: "Username",controller: usernamecontroller,
              validator: (value){
                if(value!.isEmpty){
                  return "Username cannot be empty";
                }
                return null;
              },),
              Spacing(height: 12.h),
              Customtextfield(HintText: "Email",controller: Emailcontroller,
              validator: (value){
                if(value!.isEmpty){
                  return "Email cannot be empty";
                }
                return null;
              },),
              Spacing(height: 12.h),
              Customtextfield(HintText: "Password",controller: Passwordcontroller,
              validator: (value){
                if(Passwordcontroller.text.length < 8){
                  return "Password must be at least 8 characters";
                }
                return null;
              },),
              Spacing(height: 12.h),
              Customtextfield(HintText: "Confirm Password",controller: ConfirmPasswordcontroller,
              validator: (value){
                if(ConfirmPasswordcontroller.text != Passwordcontroller.text){
                  return "Passwords do not match";
                }
                return null;
              },),
              Spacing(height: 30.h),
              Primarybutton(title: "Register", onpressed: (){
                if(formkey.currentState!.validate()){
                  context.pushNamed(AppRouter.Main);
                }
              }),
              Spacing(height: 35.h),
              Align(
               alignment: .center, 
                
                child: Text("Or Register with")),
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
                      "Already have an account?",
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
                        'Login Now',
                        style: AppStyle.TextButtonstyle.copyWith(
                            color: AppColor.blackcolor),
                      ),
                    )
                  ],
                ),
              Spacing(height: 26.h),
            ],
          ),
        ),
      ),
    ));
  }
}
