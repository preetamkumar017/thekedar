
import 'package:get/get.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/view/dashboard_view.dart';
import 'package:thekedar/view/login/login_view.dart';
import 'package:thekedar/view/splash_screen.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: RouteName.loginView,
      page: () => const LoginView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.dashboardView,
      page: () => const DashboardView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
  ];

}