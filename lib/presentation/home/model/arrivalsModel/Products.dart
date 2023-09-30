class ArrivalsProducts {
  ArrivalsProducts({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.discount, 
      this.priceAfterDiscount, 
      this.stock, 
      this.bestSeller, 
      this.image, 
      this.category,});

  ArrivalsProducts.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    stock = json['stock'];
    bestSeller = json['best_seller'];
    image = json['image'];
    category = json['category'];
  }
  num? id;
  String? name;
  String? description;
  String? price;
  num? discount;
  num? priceAfterDiscount;
  num? stock;
  num? bestSeller;
  String? image;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['discount'] = discount;
    map['price_after_discount'] = priceAfterDiscount;
    map['stock'] = stock;
    map['best_seller'] = bestSeller;
    map['image'] = image;
    map['category'] = category;
    return map;
  }

}