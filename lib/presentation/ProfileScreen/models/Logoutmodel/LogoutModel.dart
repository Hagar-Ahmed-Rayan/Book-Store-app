class LogoutModel {
  LogoutModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  LogoutModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add((v));
      });
    }
    message = json['message'];
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add((v));
      });
    }
    status = json['status'];
  }
  List<String>? data;
  String? message;
  List<String>? error;
  num? status;


}