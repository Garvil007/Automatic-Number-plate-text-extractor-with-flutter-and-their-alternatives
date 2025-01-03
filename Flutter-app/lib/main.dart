import 'package:flutter/material.dart';
import 'scan.dart';
import 'login.dart';
import 'AboutUs.dart';
import 'app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _email = '';
  String _communityCode = '';

  void _updateLoginInfo(String email, String communityCode) {
    setState(() {
      _email = email;
      _communityCode = communityCode;
    });
  }


  @override
  Widget build(BuildContext context) {
    return AppState(
      email: _email,
      communityCode: _communityCode,
      updateLoginInfo: _updateLoginInfo,

      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/scan': (context) => Scan(),
          '/aboutus': (context) => AboutUs(),
        },
      ),
    );
  }
}
