import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'app_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _communityCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final email = _emailController.text;
    final communityCode = _communityCodeController.text;
    final password = _passwordController.text;

    try {
      print('Sending login request with:');
      print('Email: $email');
      print('Community Code: $communityCode');
      print('Password: $password');

      final response = await http.post(
        // Uri.parse('http://10.0.2.2:5000/login'),
        Uri.parse('http://192.168.146.1:5000/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'community_code': communityCode,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData['message'] == 'Login successful') {
          final appState = AppState.of(context);
          appState.updateLoginInfo(email, communityCode);
          Navigator.pushNamed(context, '/scan');
        } else {
          _showErrorDialog('Login failed: ${responseData['message']}');
        }
      } else {
        _showErrorDialog('Login failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      _showErrorDialog('An error occurred: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 932,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 47,
                    top: 24,
                    child: Container(
                      width: 336.79,
                      height: 255,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/login.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 283,
                    child: SizedBox(
                      width: 277,
                      height: 54,
                      child: Text(
                        'Hi,\nWelcome back',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                          fontFamily: 'Sansation',
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 362,
                    child: Container(
                      width: 401,
                      height: 443,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 380,
                              height: 443,
                              decoration: ShapeDecoration(
                                color: Color(0x560085FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 144,
                            top: 16,
                            child: Container(
                              width: 112.01,
                              height: 46.99,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0.01,
                                    top: 0,
                                    child: SizedBox(
                                      width: 112,
                                      height: 40,
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontFamily: 'Sansation',
                                          fontWeight: FontWeight.w700,
                                          height: 1.125,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 46.99,
                                    child: Container(
                                      width: 99.02,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 3,
                                            strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 87,
                            child: Container(
                              width: 340,
                              height: 50,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 340,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF080808),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 13,
                                    child: SizedBox(
                                      width: 309,
                                      height: 22,
                                      child: TextField(
                                        controller: _emailController,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter Email',
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 1.125,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 157,
                            child: Container(
                              width: 340,
                              height: 50,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 340,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF080808),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 13,
                                    child: SizedBox(
                                      width: 309,
                                      height: 22,
                                      child: TextField(
                                        controller: _communityCodeController,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter Community Code',
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 1.125,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 227,
                            child: Container(
                              width: 340,
                              height: 50,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 340,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 13,
                                    child: SizedBox(
                                      width: 309,
                                      height: 22,
                                      child: TextField(
                                        controller: _passwordController,
                                        obscureText: true,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter Password',
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 1.125,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 310,
                            child: Container(
                              width: 340,
                              height: 50,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 340,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF4299FF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 110,
                                    top: 10,
                                    child: SizedBox(
                                      width: 120,
                                      height: 30,
                                      child: MaterialButton(
                                        onPressed: _login,
                                        child: Text(
                                          'LOG IN',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 1.125,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
