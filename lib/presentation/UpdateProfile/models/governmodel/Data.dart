class Data {
  Data({
      this.id, 
      this.governorateNameEn,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    governorateNameEn = json['governorate_name_en'];
  }
  num? id;
  String? governorateNameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['governorate_name_en'] = governorateNameEn;
    return map;
  }

}