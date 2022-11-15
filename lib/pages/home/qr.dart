import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrsystem/provider/gatetoken_provider.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    var gateTokenModel = Provider.of<GateTokenProvider>(context, listen: true).getGateTokenModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('QR TEST PAGE'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(height: 50.0),
          gateTokenModel != null
              ? Builder(
                builder: (context) {
                  return QrImage(
                    data: gateTokenModel.gateToken,
                    size: 320,
                  );
                }
              )
              : Text('loading')

          // Consumer<GateTokenProvider>(
          //   builder: (context, provider, child) {
          //     GateTokenModel? gateToken = provider.gateTokenModel;
          //     print('테스트 ${gateToken?.gateToken.toString()}');
          //     return gateToken != null ? QrImage(
          //       data: gateToken.gateToken,  //  provider.gateTokenModel.gateToken,
          //       version: QrVersions.auto,
          //       size: 320,
          //       gapless: false,
          //     ) : Text('loading');
          //   }
          // ),
        ]),
      ),
    );
  }
}
