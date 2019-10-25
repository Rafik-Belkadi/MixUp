class Restaurant {
  int id;
  String name;
  String address;
  String phone;
  String price;
  String imageUrl;
  String description;

  Restaurant(
      {this.id,
      this.name,
      this.address,
      this.phone,
      this.price,
      this.imageUrl,
      this.description});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    price = json['price'];
    imageUrl = json['image_url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    return data;
  }
}