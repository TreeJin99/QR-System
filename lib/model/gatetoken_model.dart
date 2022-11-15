class GateTokenModel {
  final String gateToken;
  final int expireDate;

  GateTokenModel({required this.gateToken, required this.expireDate});

  factory GateTokenModel.fromJson(Map<String, dynamic> json) {
    return GateTokenModel(
      gateToken: json['gateToken'],
      expireDate: json['expireDate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gateToken'] = this.gateToken;
    data['expireDate'] = this.expireDate;

    return data;
  }
}
