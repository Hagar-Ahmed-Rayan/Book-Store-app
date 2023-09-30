class Sliders {
  Sliders({
      this.image,});

  Sliders.fromJson(dynamic json) {
    image = json['image'];
  }
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    return map;
  }

}