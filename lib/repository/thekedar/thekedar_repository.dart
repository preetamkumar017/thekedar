
import 'dart:developer';

import 'package:thekedar/data/network/network_api_services.dart';
import 'package:thekedar/models/dashboard_model.dart';
import 'package:thekedar/models/login/login_model.dart';
import 'package:thekedar/models/result_model.dart';
import 'package:thekedar/models/thekedar/site_list_model.dart';
import 'package:thekedar/models/thekedar/theka_type_model.dart';
import 'package:thekedar/models/thekedar_work_list_model.dart';
import 'package:thekedar/res/app_url/app_url.dart';

class ThekedarRepository {

  final _apiService  = NetworkApiServices() ;


  Future<SiteListModel> siteListApi(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.thekedarSiteList);
      return response = SiteListModel.fromJson(response);
    }catch(e)
    {
      rethrow ;
    }
  }

  Future<ThekaTypeModel> thekedarThekaType(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.thekedarThekaType);
      return response = ThekaTypeModel.fromJson(response);
    }catch(e)
    {
      rethrow ;
    }
  }

  Future<ThekedarWorkListModel> thekedarWorkListApi(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.thekedarWorkList);
      return response = ThekedarWorkListModel.fromJson(response);
    }catch(e)
    {
      rethrow ;
    }
  }
  Future<ResultModel> thekedarEditWorkApi(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.thekedar_edit_data);
      return response = ResultModel.fromJson(response);
    }catch(e)
    {
      log(e.toString());
      rethrow ;
    }
  }
  Future<DashboardModel> thekedarDashboardApi(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.thekedar_dashboard);
      return response = DashboardModel.fromJson(response);
    }catch(e)
    {
      log(e.toString());
      rethrow ;
    }
  }
  Future<ResultModel> thekedarDeleteWorkApi(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.thekedar_delete_data);
      return response = ResultModel.fromJson(response);
    }catch(e)
    {
      log(e.toString());
      rethrow ;
    }
  }

  Future<ResultModel> uploadImageApi(dynamic files,dynamic data)async {
    try {
      dynamic response = await _apiService.getPostWithFormDataApiResponse(AppUrl.thekedarUploadImage,files,data);
      return response = ResultModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


}