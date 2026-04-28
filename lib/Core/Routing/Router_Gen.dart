import 'package:financi_ui/Core/Routing/AppRouter.dart';
import 'package:financi_ui/Features/Auth/ForgetPassword/ForgetPassword.dart';
import 'package:financi_ui/Features/Auth/LoginScreen/LoginScreen.dart';
import 'package:financi_ui/Features/Auth/NewPassword/NewPassword.dart';
import 'package:financi_ui/Features/Auth/OTPSCREEN/OTPScreen.dart';
import 'package:financi_ui/Features/Auth/PasswordChanged/PasswordChanged.dart';
import 'package:financi_ui/Features/Auth/RegisterScreen/RegisterScreen.dart';
import 'package:financi_ui/Features/Main/MainScreen.dart';
import 'package:financi_ui/Features/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:go_router/go_router.dart';

class RouterGen {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.Onboarding,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouter.Onboarding,
        name: AppRouter.Onboarding,
        builder: (context, state) {
          return const Onboardingscreen();
        },
      ),
      GoRoute(
        path: AppRouter.Login,
        name: AppRouter.Login,
        builder: (context, state) => Loginscreen(),
      ),
      GoRoute(
        path: AppRouter.Register,
        name: AppRouter.Register,
        builder: (context, state) => Registerscreen(),
      ),
      GoRoute(
        path: AppRouter.forget,
        name: AppRouter.forget,
        builder: (context, state) => Forgetpassword(),
      ),
      GoRoute(
        path: AppRouter.otp,
        name: AppRouter.otp,
        builder: (context, state) => const Otpscreen(),
      ),
      GoRoute(
        path: AppRouter.New_Password,
        name: AppRouter.New_Password,
        builder: (context, state) => const Newpassword(),
      ),
      GoRoute(
        path: AppRouter.Password_Changed,
        name: AppRouter.Password_Changed,
        builder: (context, state) => const Passwordchanged(),
      ),
      GoRoute(
        path: AppRouter.Main,
        name: AppRouter.Main,
        builder: (context, state) => Mainscreen(),
      ),
    ],
  );
}
