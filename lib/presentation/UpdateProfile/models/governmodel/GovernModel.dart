import 'Data.dart';

class GovernModel {
  GovernModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  GovernModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
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
  List<Data>? data;
  String? message;
  List<String>? error;
  num? status;


}