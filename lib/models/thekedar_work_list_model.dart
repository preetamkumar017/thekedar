class ThekedarWorkListModel {
  String? status;
  int? code;
  String? message;
  List<Result>? result;

  ThekedarWorkListModel({this.status, this.code, this.message, this.result});

  ThekedarWorkListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? createDate;
  String? workComplete;
  String? workImage;
  String? workAmount;
  String? thekaRate;
  String? isApproved;
  String? approvalRemark;
  String? approveBy;
  String? rateUnit;
  String? fullName;
  String? thekaName;
  String? siteName;
  String? siteId;
  String? remark;

  Result(
      {this.id,
        this.createDate,
        this.workComplete,
        this.workImage,
        this.workAmount,
        this.thekaRate,
        this.isApproved,
        this.approvalRemark,
        this.approveBy,
        this.rateUnit,
        this.fullName,
        this.thekaName,
        this.siteName,
        this.siteId,
        this.remark});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['create_date'];
    workComplete = json['work_complete'];
    workImage = json['work_image'];
    workAmount = json['work_amount'];
    thekaRate = json['theka_rate'];
    isApproved = json['is_approved'];
    approvalRemark = json['approval_remark'];
    approveBy = json['approve_by'];
    rateUnit = json['rate_unit'];
    fullName = json['full_name'];
    thekaName = json['theka_name'];
    siteName = json['site_name'];
    siteId = json['site_id'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['create_date'] = createDate;
    data['work_complete'] = workComplete;
    data['work_image'] = workImage;
    data['work_amount'] = workAmount;
    data['theka_rate'] = thekaRate;
    data['is_approved'] = isApproved;
    data['approval_remark'] = approvalRemark;
    data['approve_by'] = approveBy;
    data['rate_unit'] = rateUnit;
    data['full_name'] = fullName;
    data['theka_name'] = thekaName;
    data['site_name'] = siteName;
    data['site_id'] = siteId;
    data['remark'] = remark;
    return data;
  }
}
