import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrsystem/pages/calendar/calendar.dart';
import 'package:qrsystem/pages/home/home.dart';
import 'package:qrsystem/pages/home/qr.dart';
import 'package:qrsystem/pages/login/login.dart';
import 'package:provider/provider.dart';
import 'package:qrsystem/provider/gatetoken_provider.dart';
import 'package:qrsystem/provider/meeting_provider.dart';
import 'package:qrsystem/provider/securestorage_provider.dart';
import 'package:qrsystem/provider/auth_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<SecureStorageProvider>(create: (_) => SecureStorageProvider()),
        ChangeNotifierProvider<GateTokenProvider>(create: (_) => GateTokenProvider()),
        ChangeNotifierProvider<MeetingProvider>(create: (_) => MeetingProvider())
      ],
      child: MaterialApp(
        title: 'pathfinder QR Access System',
        theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/LoginPage',
        routes: {
          '/LoginPage': (context) => LoginPage(),
          '/HomePage': (context) => HomePage(),
          '/QRPage': (context) => QRPage(),
          '/CalendarPage': (context) => CalendarPage(),
        },
      ),
    );
  }
}
