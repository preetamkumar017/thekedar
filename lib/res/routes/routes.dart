
import 'package:get/get.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/view/dashboard_view.dart';
import 'package:thekedar/view/edit_progress_view.dart';
import 'package:thekedar/view/profile_view.dart';
import 'package:thekedar/view/select_site.dart';
import 'package:thekedar/view/login/login_view.dart';
import 'package:thekedar/view/splash_screen.dart';
import 'package:thekedar/view/submit_progerss_view.dart';
import 'package:thekedar/view/upload_image_view.dart';
import 'package:thekedar/view/work_complited_list_view.dart';

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
      name: RouteName.selectSite,
      page: () => const SelectSiteView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.submitProgress,
      page: () => const SubmitProgressView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.editProgress,
      page: () => const EditProgressView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.dashboardView,
      page: () => const DashboardView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.uploadImageView,
      page: () => const UploadImageView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.workCompletedListView,
      page: () => const WorkCompletedListView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.profileView,
      page: () => const ProfileView() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
  ];

}