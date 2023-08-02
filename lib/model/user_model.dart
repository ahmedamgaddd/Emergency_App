class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uId;
  String? bio;
  String? profileImage;

  UserModel({
    this.name,
    this.bio,
    this.phone,
    this.email,
    this.uId,
    this.profileImage,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bio = json['bio'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
    profileImage = json['profileImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bio': bio,
      'phone': phone,
      'email': email,
      'uId': uId,
      'profileImage': profileImage,
    };
  }
}
