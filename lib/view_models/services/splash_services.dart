import 'dart:async';
import 'package:get/get.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/view_models/services/box_storage.dart';

class SplashServices {
  void isLogin() {
    bool? isLogin = login.read("isLogin");

    if (isLogin == null || !isLogin) {
      Timer(const Duration(seconds: 3),
          () => Get.toNamed(RouteName.loginView));
    } else {
      Timer(const Duration(seconds: 3),
          () => Get.toNamed(RouteName.dashboardView));
    }
  }
}