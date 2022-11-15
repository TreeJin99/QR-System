import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:qrsystem/repository/securestorage_repository.dart';
import 'package:qrsystem/repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:qrsystem/model/signtoken_model.dart';

class AuthProvider extends ChangeNotifier {
  SignRepository _signRepository = SignRepository();
  SecureStorageRepository _secureStorageRepository = SecureStorageRepository();

  var _signUpResponse;
  get signUpResponse => _signUpResponse;

  var _signInResponse;
  get signInResponse => _signInResponse;

  /**
   * null일 경우 로그인 성공, 그 외의 값은 오류로 판단
   */
  Future<String?> onSignIn(LoginData data) async {
    _signInResponse = await _signRepository.loadSignIn(data.name, data.password);
    notifyListeners();

    if (_signInResponse is SignToken) {
      _secureStorageRepository.writeTokens(_signInResponse);
      return null;
    } else {
      return "${signInResponse.toString()}";
    }
  }

  Future<String?> onSignUp(SignupData data) async {
    String username = data.name!;
    String password = data.password!;
    String email = data.additionalSignupData!['email']!;
    String phoneNumber = data.additionalSignupData!['phoneNumber']!;
    String name = data.additionalSignupData!['name']!;

    var signUpResponse = await _signRepository.loadSignUp(username, password, email, phoneNumber, name);

    if (signUpResponse is SignToken) {
      _secureStorageRepository.writeTokens(signUpResponse);
      return null;
    } else {
      return '${signUpResponse.toString()}';
    }
  }

  Future<String> recoverPassword(String name) {
    return Future.delayed(Duration(milliseconds: 1150)).then((_) {
      // if (!users.containsKey(name)) {
      //   return 'User not exists';
      // }
      return '';
    });
  }
}
