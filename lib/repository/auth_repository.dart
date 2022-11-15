import 'dart:convert';
import 'package:qrsystem/common/constants.dart';
import 'package:http/http.dart' as http;

import '../model/signtoken_model.dart';

class SignRepository {
  Future<dynamic> loadSignIn(String username, String password) async {
    String uri = Constants.PF_API_SIGNIN_URL;
    Map<String, String> header = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    Map<String, dynamic> request = {"username": username, "password": password};

    return checkAuth(uri, header, request);
  }

  Future<dynamic> loadSignUp(String username, String password, String email, String phoneNumber, String name) async {
    String uri = Constants.PF_API_SIGNUP_URL;
    Map<String, String> header = {'Accept': 'application/json', 'Content-Type': 'application/json'};
    Map<String, dynamic> request = {
      "username": username,
      "password": password,
      "email": email,
      "phoneNumber": phoneNumber,
      "name": name,
    };

    return checkAuth(uri, header, request);
  }

  /**
   * 사용처 : SIGN IN, SIGN UP
   * 요청시 200일 경우 SignToken으로 받지만, 그 외의 경우 에러 코드를 반환
   *
   * TODO 추후에 error 내용을 반환할 수 있게 변경해야함.
   */
  dynamic checkAuth(String uri, Map<String, String> header, Map<String, dynamic> request) async {
    try {
      final http.Response response = await http.post(Uri.parse(uri), headers: header, body: jsonEncode(request));
      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return SignToken(accessToken: body['accessToken'], refreshToken: body['refreshToken']);
      } else {
        return body['message'];
      }
    } catch (e) {
      throw Exception('ERROR in AUTH_REPOSITORY');
    }
  }
}
