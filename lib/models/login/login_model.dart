class LoginModel {
  String? status;
  int? code;
  String? message;
  Result? result;

  LoginModel({this.status, this.code, this.message, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? id;
  String? fullName;
  String? thekaTypeId;
  String? assignSite;
  String? mobileNo;
  String? password;
  String? address;
  String? status;
  String? createDate;
  String? updateDate;
  Null? ip;

  Result(
      {this.id,
        this.fullName,
        this.thekaTypeId,
        this.assignSite,
        this.mobileNo,
        this.password,
        this.address,
        this.status,
        this.createDate,
        this.updateDate,
        this.ip});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    thekaTypeId = json['theka_type_id'];
    assignSite = json['assign_site'];
    mobileNo = json['mobile_no'];
    password = json['password'];
    address = json['address'];
    status = json['status'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['theka_type_id'] = this.thekaTypeId;
    data['assign_site'] = this.assignSite;
    data['mobile_no'] = this.mobileNo;
    data['password'] = this.password;
    data['address'] = this.address;
    data['status'] = this.status;
    data['create_date'] = this.createDate;
    data['update_date'] = this.updateDate;
    data['ip'] = this.ip;
    return data;
  }
}
