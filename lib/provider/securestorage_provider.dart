import 'package:flutter/cupertino.dart';
import 'package:qrsystem/model/signtoken_model.dart';
import 'package:qrsystem/repository/securestorage_repository.dart';

class SecureStorageProvider extends ChangeNotifier {
  SecureStorageRepository _secureStorageRepository = SecureStorageRepository();

  SignToken? _getSignInTokens;
  get getSignInTokens => _getSignInTokens;

  Future<void> writeTokens(SignToken tokens) async {
    await _secureStorageRepository.writeTokens(tokens);
    notifyListeners();
  }

  Future<void> readTokens() async {
    _getSignInTokens = await _secureStorageRepository.readTokens();
    notifyListeners();
  }
}
