import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:financi_ui/Features/Main/Home/Widgets/custom_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Allcards extends StatelessWidget {
  const Allcards({super.key});

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
          title: Text("All Cards", style: AppStyle.interw60018black),
          centerTitle: true,
          actions: [Icon(Icons.more_horiz)],
        ),
        body: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CustomContent(
                content: Content(
                  cardname: "X-Card",
                  cardnumber: "**** 1234",
                  balance: "\$ 4,000",
                  balanceholder: "Balance",
                  date: "12/12/2022",
                ),
                layer1size: size(width: 180.w, height: 180.h),
                layer2size: size(width: 153.w, height: 153.h),
                c: colors(
                  bgcolor: AppColor.primaryColor,
                  layercolor: AppColor.primaryColor,
                ),
                cardsize: size(width: 327.w, height: 195.h),
                space1: size(height: 18.h),
                space2: size(height: 8.h),
                space3: size(height: 28.h),
                isactive: true,
              ),
              Spacing(height: 24.h),
              CustomContent(
                content: Content(
                  cardname: "M-Card",
                  cardnumber: "**** 4545",
                  balance: "\$ 3209",
                  balanceholder: "Balance",
                  date: "12/12/2026",
                ),
                layer1size: size(width: 180.w, height: 180.h),
                layer2size: size(width: 153.w, height: 153.h),
                c: colors(
                  bgcolor: const Color.fromARGB(255, 206, 6, 224),
                  layercolor: const Color.fromARGB(255, 206, 6, 224),
                ),
                cardsize: size(width: 327.w, height: 195.h),
                space1: size(height: 18.h),
                space2: size(height: 8.h),
                space3: size(height: 28.h),
                isactive: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
