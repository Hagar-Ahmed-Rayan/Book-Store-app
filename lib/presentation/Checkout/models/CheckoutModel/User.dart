class User {
  User({
      this.userId, 
      this.userName, 
      this.userEmail, 
      this.address, 
      this.phone,});

  User.fromJson(dynamic json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    address = json['address'];
    phone = json['phone'];
  }
  num? userId;
  String? userName;
  String? userEmail;
  String? address;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_name'] = userName;
    map['user_email'] = userEmail;
    map['address'] = address;
    map['phone'] = phone;
    return map;
  }

}