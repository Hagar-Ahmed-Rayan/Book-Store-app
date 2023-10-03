// class Product {
//   Product({
//       this.id,
//       this.name,
//       this.price,
//       this.category,
//       this.image,
//       this.discount,
//       this.stock,
//       this.description,
//       this.bestSeller,});
//
//   Product.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     price = json['price'];
//     category = json['category'];
//     image = json['image'];
//     discount = json['discount'];
//     stock = json['stock'];
//     description = json['description'];
//     bestSeller = json['best_seller'];
//   }
//   num? id;
//   String? name;
//   String? price;
//   String? category;
//   String? image;
//   num? discount;
//   num? stock;
//   String? description;
//   num? bestSeller;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['price'] = price;
//     map['category'] = category;
//     map['image'] = image;
//     map['discount'] = discount;
//     map['stock'] = stock;
//     map['description'] = description;
//     map['best_seller'] = bestSeller;
//     return map;
//   }
//
// }