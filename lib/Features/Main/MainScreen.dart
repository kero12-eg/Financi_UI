import 'package:financi_ui/Core/Styling/app_assets.dart';
import 'package:financi_ui/Core/Styling/app_color.dart';
import 'package:financi_ui/Features/Main/ALLCards/AllCards.dart';
import 'package:financi_ui/Features/Main/Home/ChartBar/ChartBar.dart';
import 'package:financi_ui/Features/Main/Home/HomeScreen.dart';
import 'package:financi_ui/Features/Main/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

List<Widget> screens = [
  Homescreen(),
  Chartbar(),
  Center(child: Text('Add')),
  Allcards(),
  Profile(),
];

class _MainscreenState extends State<Mainscreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.primaryColor,
          currentIndex: currentIndex,
          elevation: 0.7,

          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.Chart),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primaryColor,
                ),
                child: Image.asset(AppAssets.Plus),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.wallet),
              label: 'My card',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.profile),
              label: 'Profile',
            ),
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
