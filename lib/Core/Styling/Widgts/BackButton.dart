import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Backbuttons extends StatelessWidget {
  const Backbuttons({super.key, this.onpressed, this.color});
final void Function()? onpressed;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed ?? () {
        context.pop();
      },
      icon: Image.asset(AppAssets.backbutton, width: 41.w, height: 41.h,color: color,),
    );
  }
}
