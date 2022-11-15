
import 'package:flutter/cupertino.dart';
import 'package:qrsystem/model/gatetoken_model.dart';
import 'package:qrsystem/repository/gatetoken_repository.dart';

class GateTokenProvider extends ChangeNotifier {
  GateTokenRepository _gateTokenRepository = GateTokenRepository();

  GateTokenModel? _getGateTokenModel;
  get getGateTokenModel => _getGateTokenModel;

  void loadGateToken(String accessToken) async {
    _getGateTokenModel = await _gateTokenRepository.getGateToken(accessToken);
    notifyListeners();
  }
}