import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qrsystem/model/signtoken_model.dart';

import '../common/constants.dart';


class SecureStorageRepository {
  final _storage = const FlutterSecureStorage();

  writeTokens(SignToken tokens) async {
     await _storage.write(key: Constants.ACCESS_TOKEN, value: tokens.accessToken);
     await _storage.write(key: Constants.REFRESH_TOKEN, value: tokens.refreshToken);
  }

  Future<SignToken> readTokens() async {
    var _accessToken = await _storage.read(key: Constants.ACCESS_TOKEN);
    var _refreshToken = await _storage.read(key: Constants.REFRESH_TOKEN);

    return SignToken(accessToken: _accessToken, refreshToken: _refreshToken);
  }
}
