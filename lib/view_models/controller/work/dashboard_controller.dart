import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/data/response/status.dart';
import 'package:thekedar/models/dashboard_model.dart';
import 'package:thekedar/models/login/login_model.dart' as userData;
import 'package:thekedar/repository/thekedar/thekedar_repository.dart';

class DashboardController extends GetxController
{
  final _myRepo = ThekedarRepository();

  RxString siteId = "".obs;
  get getSiteId => siteId.value;
  set setSiteId(String value) => siteId.value = value;

  String id = "";
  String theka_type_id = "";
  final rxRequestStatus = Status.LOADING.obs ;
  final dashboardData  = DashboardModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setDashboardData(DashboardModel value) => dashboardData.value = value ;
  void setError(String value) => error.value = value ;

  getData() async {
    setRxRequestStatus(Status.LOADING);
    await getUserData();
    Map data = {
      'thekedar_id':id,
    };
    _myRepo.thekedarDashboardApi(data).then((value) {
      log(value.toJson().toString());

      if(value.code==200)
      {
        setDashboardData(value);
      }

      setRxRequestStatus(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
      log(error.toString());
    });
  }


  getUserData() async {
    userData.Result result = userData.Result();
    SharedPreferences sp = await SharedPreferences.getInstance();
    final resultJsonString = sp.getString('result');

    if (resultJsonString != null) {
      final resultJson = jsonDecode(resultJsonString);
      result = userData.Result.fromJson(resultJson);
      id = result.id ?? "";
      theka_type_id = result.thekaTypeId ?? "";
    }

  }

}