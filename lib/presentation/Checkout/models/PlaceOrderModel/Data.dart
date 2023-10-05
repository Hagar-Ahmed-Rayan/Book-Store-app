class Data {
  Data({
      this.id,});

  Data.fromJson(dynamic json) {
    id = json['id'];
  }
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}