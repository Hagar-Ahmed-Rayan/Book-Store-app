import 'package:bookstore/presentation/LoginScreen/model/SignUpModel/ErrorModel.dart';

import 'Data.dart';

class SignUpModel {
  SignUpModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  SignUpModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add(ErrorModel.fromJson(v));
      });
    }
    status = json['status'];
  }
  Data? data;
  String? message;
  List<dynamic>? error;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    if (error != null) {
      map['error'] = error?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}