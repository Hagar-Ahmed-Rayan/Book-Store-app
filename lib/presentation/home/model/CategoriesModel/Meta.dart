class Meta {
  Meta({
      this.total, 
      this.perPage, 
      this.currentPage, 
      this.lastPage,});

  Meta.fromJson(dynamic json) {
    total = json['total'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
  }
  num? total;
  num? perPage;
  num? currentPage;
  num? lastPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['per_page'] = perPage;
    map['current_page'] = currentPage;
    map['last_page'] = lastPage;
    return map;
  }

}