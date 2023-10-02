import 'Data.dart';

class UserProfileModel {
  UserProfileModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  UserProfileModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add((v));
      });
    }
    status = json['status'];
  }
  Data? data;
  String? message;
  List<String>? error;
  num? status;


}