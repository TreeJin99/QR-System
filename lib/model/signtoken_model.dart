class SignToken {
  final String? accessToken;
  final String? refreshToken;

  SignToken({required this.accessToken, required this.refreshToken});

  factory SignToken.fromJson(Map<String, dynamic> json) {
    return SignToken(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;

    return data;
  }
}
