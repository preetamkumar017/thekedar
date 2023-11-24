import 'dart:convert';
import 'dart:developer';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/data/response/status.dart';
import 'package:thekedar/models/thekedar/site_list_model.dart';
import 'package:thekedar/models/thekedar/theka_type_model.dart';
import 'package:thekedar/repository/thekedar/thekedar_repository.dart';
import 'package:thekedar/models/login/login_model.dart' as userData;
import 'package:thekedar/utils/utils.dart';

class SubmitProgressController extends GetxController
{
  Rx<TextEditingController>  siteName = TextEditingController().obs;
  Rx<TextEditingController>  progress = TextEditingController().obs;
  Rx<TextEditingController>  remark = TextEditingController().obs;
  RxString siteId = "".obs;
  RxString thekedarId = "".obs;
  RxString thekedarName = "".obs;
  RxString id = "".obs;
  RxString rate = "".obs;

  get getId => id.value;
  get getSiteId => siteId.value;
  get getRate => rate.value;
  get getThekedarId => thekedarId.value;
  get getThekedarName => thekedarName.value;
  get getSiteName => siteName.value;
  get getProgress => progress.value;
  get getRemark => remark.value;


  get getSiteNameText => siteName.value.text;
  get getProgressText => progress.value.text;
  get getRemarkText => remark.value.text;

  set setId(String value) => id.value = value;
  set setSiteId(String value) => siteId.value = value;
  set setRate(String value) => rate.value = value;
  set setThekedarId(String value) => thekedarId.value = value;
  set setThekedarName(String value) => thekedarName.value = value;
  set setSiteNameText(String value) => siteName.value.text = value;
  set setProgressText(String value) => progress.value.text = value;
  set setRemarkText(String value) => remark.value.text = value;


  final _myRepo = ThekedarRepository();

  String theka_type_id = "";
  final rxRequestStatus = Status.LOADING.obs ;
  final rxRequestStatusSite = Status.LOADING.obs ;
  final siteList  = SiteListModel().obs ;
  final thekaType  = ThekaTypeModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setRxRequestStatusSite(Status value) => rxRequestStatusSite.value = value ;
  void setSiteList(SiteListModel value) => siteList.value = value ;
  void setThekaType(ThekaTypeModel value) => thekaType.value = value ;
  void setError(String value) => error.value = value ;

  getData() async {
    setRxRequestStatusSite(Status.LOADING);
    await getUserData();
    Map data = {
      'theka_id':getId,
    };
    _myRepo.siteListApi(data).then((value) {

      if(value.code==200)
      {
        setSiteList(value);
      }

      setRxRequestStatusSite(Status.COMPLETED);
    }).onError((error, stackTrace) {
      setRxRequestStatusSite(Status.ERROR);
      log(error.toString());
    });
  }

  getThekaType() async {
    setRxRequestStatus(Status.LOADING);
    await getUserData();
    Map data = {
      'theka_type_id':theka_type_id,
    };
    _myRepo.thekedarThekaType(data).then((value) {

      if(value.code==200)
      {
        setThekaType(value);
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
      setId = result.id ?? "";
      theka_type_id = result.thekaTypeId ?? "";
    }

  }

  editData(context,String id)
  {

    Map data = {
      'id': id,
      'site_id':getSiteId,
      'work_complete':getProgressText,
      'work_amount':(int.parse(getProgressText)*int.parse(getRate)).toString(),
      'remark':getRemarkText,
    };
    log(data.toString());
    _myRepo.thekedarEditWorkApi(data).then((value) async {
      if(value.code==200)
        {
         await CoolAlert.show(context: context, type: CoolAlertType.success);
        }else
          {
            await CoolAlert.show(context: context, type: CoolAlertType.error,text: "Something Went Wrong");
          }
      Get.back();

    }).onError((error, stackTrace) {

    });
  }


  deleteData(context,String id)
  {

    Map data = {
      'id': id,
    };
    log(data.toString());
    _myRepo.thekedarDeleteWorkApi(data).then((value) async {
      if(value.code==200)
      {
        await CoolAlert.show(context: context, type: CoolAlertType.success);
      }else
      {
        await CoolAlert.show(context: context, type: CoolAlertType.error,text: "Something Went Wrong");
      }
      Get.back();

    }).onError((error, stackTrace) {

    });
  }


}