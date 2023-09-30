
import 'Products.dart';

class Data {
  Data({
      this.products,});

  Data.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ArrivalsProducts.fromJson(v));
      });
    }
  }
  List<ArrivalsProducts>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}