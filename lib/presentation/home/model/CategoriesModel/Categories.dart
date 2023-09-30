class Categories {
  Categories({
      this.id, 
      this.name, 
      this.productsCount,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    productsCount = json['products_count'];
  }
  num? id;
  String? name;
  num? productsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['products_count'] = productsCount;
    return map;
  }

}