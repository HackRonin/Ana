import 'package:ana/presentation/features/bottom_nav/bottom_nav_screen.dart';
import 'package:ana/presentation/features/forgot_password/forgot_password_screen.dart';
import 'package:ana/presentation/features/login/login_screen.dart';
import 'package:ana/presentation/features/register/register_screen.dart';
import 'package:ana/presentation/features/reset_info/reset_info_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

Duration get transitionDuration => const Duration(milliseconds:900);

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition:Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
     // binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
      transition:Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      transition:Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.resetInfo,
      page: () => const ResetInfoScreen(),
      transition:Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => const BottomNavScreen(),
      transition:Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
  ];
}