
import 'package:thekedar/data/network/network_api_services.dart';
import 'package:thekedar/models/login/login_model.dart';
import 'package:thekedar/res/app_url/app_url.dart';

class LoginRepository {

  final _apiService  = NetworkApiServices() ;


  Future<LoginModel> loginApi(var data) async{
    try{
      dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
      return response = LoginModel.fromJson(response);
    }catch(e)
    {
    rethrow ;
    }
  }



}