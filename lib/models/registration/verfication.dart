class VerificationModel {
  bool? status;
  int? code;
  String? msg;

  VerificationModel({this.status, this.code, this.msg});

  VerificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}
