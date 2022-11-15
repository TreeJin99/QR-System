class UserInfoModel {
  final String username;
  final String password;
  final String email;
  final String phoneNumber;
  final String name;

  UserInfoModel(
      {required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber,
      required this.name});

  factory UserInfoModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserInfoModel(
        username: parsedJson['username'],
        password: parsedJson['password'],
        email: parsedJson['email'],
        phoneNumber: parsedJson['phoneNumber'],
        name: parsedJson['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['name'] = this.name;

    return data;
  }
}
