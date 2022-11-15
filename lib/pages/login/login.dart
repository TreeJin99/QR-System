import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrsystem/provider/auth_provider.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../common/util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// TODO 자동 로그인 만들기
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider _signProvider = Provider.of<AuthProvider>(context, listen: false);

    return FlutterLogin(
      title: 'pathfinder QR',
      userValidator: checkIsEmptry,
      logo: AssetImage('assets/images/ecorp.png'),
      theme: LoginTheme(
        primaryColor: Color(0x398F89A1),
        accentColor: Colors.yellow,
        errorColor: Colors.redAccent,
        titleStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        buttonTheme: LoginButtonTheme(splashColor: Colors.grey, backgroundColor: Colors.cyan),
      ),
      onLogin: _signProvider.onSignIn,
      onSignup: _signProvider.onSignUp,
      onSubmitAnimationCompleted: () {
        Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
      },
      messages: LoginMessages(loginButton: '로그인', signupButton: '회원가입', userHint: 'User ID'),
      onRecoverPassword: _signProvider.recoverPassword,
      additionalSignupFields: [
        UserFormField(keyName: 'email', displayName: '이메일', fieldValidator: checkIsEmptry),
        UserFormField(keyName: 'phoneNumber', displayName: '휴대전화', fieldValidator: checkIsEmptry),
        UserFormField(keyName: 'name', displayName: '성함', fieldValidator: checkIsEmptry)
      ],
    );
  }
}
