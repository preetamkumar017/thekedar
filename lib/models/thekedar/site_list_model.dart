class SiteListModel {
  String? status;
  int? code;
  String? message;
  Result? result;

  SiteListModel({this.status, this.code, this.message, this.result});

  SiteListModel.fromJson(Map<String, dynamic> json) {
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
  String? assignSite;
  String? siteNames;

  Result({this.assignSite, this.siteNames});

  Result.fromJson(Map<String, dynamic> json) {
    assignSite = json['assign_site'];
    siteNames = json['site_names'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assign_site'] = assignSite;
    data['site_names'] = siteNames;
    return data;
  }
}
