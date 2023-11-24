import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/data/response/status.dart';
import 'package:thekedar/models/login/login_model.dart' as userData;
import 'package:thekedar/models/thekedar_work_list_model.dart';
import 'package:thekedar/repository/thekedar/thekedar_repository.dart';

class WorkListController extends GetxController
{


  final _myRepo = ThekedarRepository();

  Rx<TextEditingController>  siteName = TextEditingController().obs;
  Rx<TextEditingController> date = TextEditingController().obs;
  RxString siteId = "".obs;

  get getSiteName => siteName.value;
  get getSiteNameText => siteName.value.text;
  get getSiteId => siteId.value;
  get getDate => date.value;
  get getDateText => date.value.text;

  set setSiteNameText(String value) => siteName.value.text = value;
  set setSiteId(String value) => siteId.value = value;
  set setDate(String value) => date.value.text = value;

  String id = "";
  String theka_type_id = "";
  final rxRequestStatus = Status.LOADING.obs ;
  final workList  = ThekedarWorkListModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setWorkList(ThekedarWorkListModel value) => workList.value = value ;
  void setError(String value) => error.value = value ;

  getData() async {
    setRxRequestStatus(Status.LOADING);
    await getUserData();
    Map data = {
      'theka_id':id,
    };
    _myRepo.thekedarWorkListApi(data).then((value) {
      log(value.toJson().toString());

      if(value.code==200)
      {
        setWorkList(value);
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