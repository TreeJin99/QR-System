import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qrsystem/common/constants.dart';
import 'package:qrsystem/model/gatetoken_model.dart';

class GateTokenRepository {
  Future<GateTokenModel> getGateToken(String accessToken) async {
    var uri = Constants.PF_API_BASEURL + '/gate/getGateToken';
    Map<String, String> header = {'Authorization': ' Bearer ${accessToken}', 'Accept': 'application/json'};

    try {
      final response = await http.post(Uri.parse(uri), headers: header);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        var gateTokenList = GateTokenModel(gateToken: body['gateToken'], expireDate: body['expireDate']);
        return gateTokenList;
      }else{
        throw Exception('ERROR in GATETOKEN_REPOSITORY');
      }
    } catch (e) {
      throw Exception('ERROR in GATETOKEN_REPOSITORY');
    }
  }
}
