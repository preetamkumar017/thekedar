import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/repository/login_repository/login_repository.dart';
import 'package:thekedar/res/routes/routes_name.dart';
import 'package:thekedar/utils/utils.dart';
import 'package:thekedar/view_models/services/box_storage.dart';

class LoginViewModel extends GetxController {

  final _api = LoginRepository();

  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi(){
    loading.value = true ;
    Map data = {
      'mobile' : emailController.value.text,
      'password' : passwordController.value.text
    };
    _api.loginApi(data).then((value) async {
      loading.value = false;
      if (value.code == 200) {
        login.write("isLogin", true);

        // Convert the Result object to a JSON string
        final resultJson = value.result?.toJson(); // Assuming toJson() method is implemented in Result class
        final resultJsonString = jsonEncode(resultJson);

        // Save the JSON string in SharedPreferences
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('result', resultJsonString);

        Get.offAllNamed(RouteName.dashboardView);
      } else {
        Utils.snackBar('Error', value.message.toString());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });

  }
}