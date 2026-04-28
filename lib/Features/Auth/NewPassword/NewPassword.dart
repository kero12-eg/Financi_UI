import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/BackButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/CustomTextField.dart';
import 'package:financi_ui/Core/Styling/Widgts/PrimaryButton.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passwordcontroller = TextEditingController();
    confirmpasswordcontroller = TextEditingController();
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
                Text("Create new password", style: AppStyle.Headlinestyle),
                Spacing(height: 10.h),
                Text(
                    "Your new password must be unique from those previously used.",
                    style: AppStyle.Secondarylinestyle),
                Spacing(height: 32.h),
                Customtextfield(HintText: "New Password",controller: passwordcontroller,validator: (value){
                  if(passwordcontroller.text.length < 8){
                    return "Password must be at least 8 characters long";
                  }
                  return null;
                },),
                Spacing(height: 15.h),
                Customtextfield(HintText: "Confirm Password",controller: confirmpasswordcontroller,validator: (value){
                  if(passwordcontroller.text.length < 8){
                    return null;
                  }
                  else{
                    if(passwordcontroller.text != confirmpasswordcontroller.text){
                      return "Passwords do not match";
                    }
                    return null;
                  }
                }),
                Spacing(height: 38.h),
                Primarybutton(title: "Reset Password", onpressed: () {
                  if(_formkey.currentState!.validate()){
                    context.pushNamed(AppRouter.Password_Changed);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
