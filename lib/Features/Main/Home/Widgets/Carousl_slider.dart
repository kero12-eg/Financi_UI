import 'package:carousel_slider/carousel_slider.dart';
import 'package:financi_ui/Core/Styling/Widgts/Spacing.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Features/Main/Home/Widgets/Dots_Indcator.dart';
import 'package:financi_ui/Features/Main/Home/Widgets/custom_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouslSlider extends StatefulWidget {
  const CarouslSlider({super.key, this.height});
  final double? height;
  @override
  State<CarouslSlider> createState() => _CarouslSliderState();
}

class _CarouslSliderState extends State<CarouslSlider> {
  CarouselSliderController controller = CarouselSliderController();
  double currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: widget.height ?? 263.h,
            viewportFraction: 0.7,
            autoPlay: true,
            padEnds: false,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            disableCenter: true,
            onPageChanged: (index, reason) => setState(() {
              currentPage = index.toDouble();
            }),
          ),

          items: [
            CustomContent(
              content: Content(
                cardname: "X-Card",
                cardnumber: "**** 1234",
                balance: "\$ 4,000",
                balanceholder: "Balance",
                date: "12/12/2022",
              ),
              c: colors(
                bgcolor: AppColor.primaryColor,
                layercolor: AppColor.primaryColor,
              ),
              cardsize: size(width: 207.w, height: 263.h),
              space1: size(height: 57.h),
              space2: size(height: 8.h),
              space3: size(height: 60.h),
              isactive: false,
              layer1size: size(width: 207.w, height: 190.h),
              layer2size: size(width: 153.w, height: 110.h),
            ),

            CustomContent(
              content: Content(
                cardname: "M-Card",
                cardnumber: "**** 4545",
                balance: "\$ 3209",
                balanceholder: "Balance",
                date: "12/12/2026",
              ),
              c: colors(
                bgcolor: const Color.fromARGB(255, 206, 6, 224),
                layercolor: const Color.fromARGB(255, 206, 6, 224),
              ),
              cardsize: size(width: 207.w, height: 263.h),
              space1: size(height: 57.h),
              space2: size(height: 8.h),
              space3: size(height: 60.h),
              isactive: false,
              layer1size: size(width: 207.w, height: 190.h),
              layer2size: size(width: 153.w, height: 110.h),
            ),
          ],
        ),
        Spacing(height: 16.h),
        DotsIndcator(
          count: 2,
          currentPage: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index.toDouble();
            });
            controller.animateToPage(index);
          },
        ),
      ],
    );
  }
}
