


class ErrorModel {
  ErrorModel({
    this.field,
    this.message,
  });

  ErrorModel.fromJson(dynamic json) {
    field = json['field'];
    message = json['message'];
  }

  String? field;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['field'] = field;
    map['message'] = message;
    return map;
  }
}