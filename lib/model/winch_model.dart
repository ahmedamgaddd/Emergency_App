class WinchModel {
  String? description;
  String? image;
  String? name;
  String? phone;
  WinchModel({
    this.description,
    this.image,
    this.name,
    this.phone,
  });
  WinchModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'image': image,
      'name': name,
      'phone': phone,
    };
  }
}
