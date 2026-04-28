import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> icons = [
  AppAssets.send_money,
  AppAssets.pay_bill,
  AppAssets.send_money,
  AppAssets.contact,
];
List<String> title = ["Send Money", "Pay The Bill", "Request", "Contact"];
List<String> subtitle = [
  "Take acc to acc",
  "Lorem ipsum",
  "Lorem ipsum",
  "Lorem ipsum",
];

class Gridviewcontent extends StatelessWidget {
  const Gridviewcontent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          width: 156.w,
          height: 140.h,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 54.w, vertical: 16.h),
                child: Image.asset(icons[index], width: 48.w, height: 48.h),
              ),
              Spacing(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Align(
                  alignment: .center,
                  child: Text(
                    title[index],
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    style: AppStyle.TextButtonstyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.blackcolor2,
                    ),
                  ),
                ),
              ),
              Spacing(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Align(
                  alignment: .center,
                  child: Text(
                    subtitle[index],
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    style: AppStyle.TextButtonstyle.copyWith(
                      color: AppColor.Greycolor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
