import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Details(),
        ]),
      ),
    );
  }
}

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 430,
                  height: 932,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/car.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 862,
                child: Container(
                  width: 430,
                  height: 70,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 430,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0x994399FF),
                            border: Border(
                              left: BorderSide(),
                              top: BorderSide(width: 1),
                              right: BorderSide(),
                              bottom: BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 347,
                        top: 15,
                        child: Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: FlutterLogo(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 430,
                  height: 90,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 430,
                          height: 117,
                          decoration: BoxDecoration(
                            color: Color(0x7F4399FF),
                            border: Border(
                              left: BorderSide(),
                              top: BorderSide(width: 1),
                              right: BorderSide(),
                              bottom: BorderSide(width: 1),
                            ),
                            boxShadow: [
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
                        left: 45,
                        top: 8,
                        child: Container(
                          width: 307,
                          height: 71,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 6,
                top: 100,
                child: Container(
                  width: 400,
                  height: 666,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 380,
                          height: 600,
                          decoration: ShapeDecoration(
                            color: Color(0x7F4C4646),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 15,
                        child: Container(
                          width: 379,
                          height: 226,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 360,
                                  height: 226,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/car.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 255,
                        child: Container(
                          width: 382,
                          height: 351,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 360,
                                  height: 330,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 58,
                                child: SizedBox(
                                  width: 290,
                                  height: 34,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Number plate ',
                                          style: TextStyle(
                                            color: Color(0xFF4466FF),
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ': MH20EE7602',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 106,
                                child: SizedBox(
                                  width: 290,
                                  height: 34,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Owner name    ',
                                          style: TextStyle(
                                            color: Color(0xFF4466FF),
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ': XYZ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 154,
                                child: SizedBox(
                                  width: 290,
                                  height: 34,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Contact no.     ',
                                          style: TextStyle(
                                            color: Color(0xFF4466FF),
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ': 1234567890',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 202,
                                child: SizedBox(
                                  width: 339,
                                  height: 64,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Address            ',
                                          style: TextStyle(
                                            color: Color(0xFF4466FF),
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ': b-5 asha apartment \n                                opp. dmart, anand',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'Sansation',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 9,
                                child: SizedBox(
                                  width: 190,
                                  height: 35,
                                  child: Text(
                                    'vehicle details',
                                    style: TextStyle(
                                      color: Color(0xFF4466FF),
                                      fontSize: 24,
                                      fontFamily: 'Sansation',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
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
              Positioned(
                left: 0,
                top: 712,
                child: Container(
                  width: 430,
                  height: 65,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 430,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border(
                              left: BorderSide(color: Colors.transparent),
                              top: BorderSide(width: 1, color: Colors.transparent),
                              right: BorderSide(color: Colors.transparent),
                              bottom: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 10,
                        child: Container(
                          width: 45,
                          height: 45,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/scanner.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 130,
                        top: 10,
                        child: Container(
                          width: 45,
                          height: 45,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/about.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 220,
                        top: 10,
                        child: Container(
                          width: 45,
                          height: 45,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/account.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 310,
                        top: 10,
                        child: Container(
                          width: 45,
                          height: 45,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/logout.png',
                            color: Colors.white,
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
    );
  }
}