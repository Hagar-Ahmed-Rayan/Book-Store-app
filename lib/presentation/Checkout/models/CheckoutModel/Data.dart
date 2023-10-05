import 'User.dart';
import 'CartItems.dart';

class Data {
  Data({
      this.id, 
      this.user, 
      this.total, 
      this.cartItems,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    total = json['total'];
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
  }
  num? id;
  User? user;
  String? total;
  List<CartItems>? cartItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['total'] = total;
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}