class DashboardModel {
  String? status;
  int? code;
  String? message;
  String? totalWorkComplete;
  String? thekaRate;
  String? rateUnit;
  List<ThekaList>? thekaList;

  DashboardModel(
      {this.status,
        this.code,
        this.message,
        this.totalWorkComplete,
        this.thekaRate,
        this.rateUnit,
        this.thekaList});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalWorkComplete = json['total_work_complete'];
    thekaRate = json['theka_rate'];
    rateUnit = json['rate_unit'];
    if (json['theka_list'] != null) {
      thekaList = <ThekaList>[];
      json['theka_list'].forEach((v) {
        thekaList!.add(new ThekaList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['total_work_complete'] = this.totalWorkComplete;
    data['theka_rate'] = this.thekaRate;
    data['rate_unit'] = this.rateUnit;
    if (this.thekaList != null) {
      data['theka_list'] = this.thekaList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThekaList {
  String? siteName;
  String? createDate;

  ThekaList({this.siteName, this.createDate});

  ThekaList.fromJson(Map<String, dynamic> json) {
    siteName = json['site_name'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_name'] = this.siteName;
    data['create_date'] = this.createDate;
    return data;
  }
}
