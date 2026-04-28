import 'package:financi_ui/Core/Routing/Router_Gen.dart';
import 'package:financi_ui/Core/Styling/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: RouterGen.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightcolor,
        );
      },
    );
  }
}
