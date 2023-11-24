class ThekaTypeModel {
  String? status;
  int? code;
  String? message;
  Result? result;

  ThekaTypeModel({this.status, this.code, this.message, this.result});

  ThekaTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? id;
  String? thekaName;
  String? thekaRate;
  String? rateUnit;
  String? status;
  String? createBy;
  String? createDate;
  String? updateDate;
  Null? ip;

  Result(
      {this.id,
        this.thekaName,
        this.thekaRate,
        this.rateUnit,
        this.status,
        this.createBy,
        this.createDate,
        this.updateDate,
        this.ip});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thekaName = json['theka_name'];
    thekaRate = json['theka_rate'];
    rateUnit = json['rate_unit'];
    status = json['status'];
    createBy = json['create_by'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['theka_name'] = thekaName;
    data['theka_rate'] = thekaRate;
    data['rate_unit'] = rateUnit;
    data['status'] = status;
    data['create_by'] = createBy;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['ip'] = ip;
    return data;
  }
}
