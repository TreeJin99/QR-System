import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrsystem/model/signtoken_model.dart';
import 'package:qrsystem/provider/gatetoken_provider.dart';
import 'package:qrsystem/provider/securestorage_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SecureStorageProvider _secureStorageProvider = Provider.of<SecureStorageProvider>(context, listen: true);
    GateTokenProvider _gateTokenProvider = Provider.of<GateTokenProvider>(context, listen: false);

    _secureStorageProvider.readTokens();
    SignToken? signInTokenModel = _secureStorageProvider.getSignInTokens;

    // TODO 로그아웃 버튼 추가
    return Scaffold(
        appBar: AppBar(
          title: Text('테스트!!'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/temp_puppy.png'),
                backgroundColor: Colors.white,
              ),
              accountName: Text("이름: 테스트 모델"),
              accountEmail: Text("이메일: 테스트 모델"),
            ),
            ListTile(
              leading: Icon(Icons.qr_code),
              title: Text('QR Code'),
              onTap: () {
                // TODO null값이 들어가면 실행이 되지 않은 것을 해결할 것
                // _gateTokenProvider.loadGateToken(_secureStorageProvider.getSignInTokens.accessToken);
                Navigator.pushNamed(context, '/QRPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('CalendarPage'),
              onTap: () {
                Navigator.pushNamed(context, '/CalendarPage');
              },
            ),
          ]),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('ACCESS TOKEN 값'),
            // signInTokenModel != null ? Text(_secureStorageProvider.getSignInTokens.accessToken) : Text('loading...'), // -> 값 딜레이 주기?
            SizedBox(
              height: 50,
            ),
            Text('REFRESH TOKEN 값'),
            // signInTokenModel != null ? Text(_secureStorageProvider.getSignInTokens.refreshToken) : Text('loading...'),
            Center(
              child: (Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                ],
              )),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
          ],
        ));
  }
}
