import 'package:flutter/material.dart';
import 'login.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int currentIndex = 1; // Assuming About Us is the second tab

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/scan');
        break;
      case 1:
      // Current page, do nothing
        break;
      case 2:
        Navigator.pushNamed(context, '/account');
        break;
      case 3:
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false,
        );
        break;
    }
  }

  Future<bool> _onWillPop() async {
    // If the current index is 3 (logout), we should navigate to the login page
    if (currentIndex == 3) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false,
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 430,
                    height: 932,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 430,
                            height: 932,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/car.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 430,
                            height: 97,
                            decoration: const BoxDecoration(
                              color: Color(0x994399FF),
                              border: Border(
                                left: BorderSide(color: Colors.transparent),
                                top: BorderSide(
                                    width: 1, color: Colors.transparent),
                                right: BorderSide(color: Colors.transparent),
                                bottom: BorderSide(
                                    width: 1, color: Colors.transparent),
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
                          left: 6,
                          top: 110,
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
                                    height: 620,
                                    decoration: ShapeDecoration(
                                      color: const Color(0x7F4C4646),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 110,
                                  top: 9,
                                  child: SizedBox(
                                    width: 152,
                                    height: 53,
                                    child: Text(
                                      'ABOUT US',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontFamily: 'Sansation',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 6,
                                  top: 60,
                                  child: SizedBox(
                                    width: 396,
                                    height: 77,
                                    child: Text(
                                      'Welcome to Aashma Technologies',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'Sansation',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 11,
                                  top: 135,
                                  child: SizedBox(
                                    width: 381,
                                    height: 233,
                                    child: Text(
                                      'about us  about us about us about us about us about us about us  about us  about us  about us  about us  about us  about us  about us  about us  about us  about us  about us  about us ',
                                      style: TextStyle(
                                        color: Color(0xFFC0F3CE),
                                        fontSize: 24,
                                        fontFamily: 'Sansation',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 12,
                                  top: 370,
                                  child: SizedBox(
                                    width: 399,
                                    height: 32,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                            'For queries and support click',
                                            style: TextStyle(
                                              color: Color(0xFFC0F3CE),
                                              fontSize: 24,
                                              fontFamily: 'Sansation',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontFamily: 'Sansation',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'here\n\n',
                                            style: TextStyle(
                                              color: Color(0xFF0000EE),
                                              fontSize: 24,
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
                                  left: 7,
                                  top: 465,
                                  child: Container(
                                    width: 390,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide
                                              .strokeAlignCenter,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 80,
                                  top: 470,
                                  child: SizedBox(
                                    width: 251,
                                    height: 34,
                                    child: Text(
                                      'connect with us ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontFamily: 'Sansation',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 160,
                                  top: 520,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Image.asset(
                                        'assets/images/linkedin.png'),
                                  ),
                                ),
                                Positioned(
                                  left: 298,
                                  top: 520,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Image.asset(
                                        'assets/images/instagram.png'),
                                  ),
                                ),
                                Positioned(
                                  left: 22,
                                  top: 520,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Image.asset(
                                        'assets/images/facebook.png'),
                                  ),
                                ),
                                const Positioned(
                                  left: 340,
                                  top: 550,
                                  child: SizedBox(
                                      width: 50, height: 50, child: Stack()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 57,
                          top: 40,
                          child: SizedBox(width: 317, height: 71),
                        ),
                        Positioned(
                          left: 45,
                          top: 10,
                          child: Container(
                            width: 307,
                            height: 71,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/logo.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 20,
                          top: 520,
                          child: SizedBox(
                            width: 365,
                            height: 29,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'For FAQs click',
                                    style: TextStyle(
                                      color: Color(0xFFC0F3CE),
                                      fontSize: 24,
                                      fontFamily: 'Sansation',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' here',
                                    style: TextStyle(
                                      color: Color(0xFF0000EE),
                                      fontSize: 24,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  border: Border(
                    left: BorderSide(color: Colors.transparent),
                    top: BorderSide(width: 1, color: Colors.transparent),
                    right: BorderSide(color: Colors.transparent),
                    bottom: BorderSide(color: Colors.transparent),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 40,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          onTabTapped(0);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            border: currentIndex == 0
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/scanner.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 130,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          onTabTapped(1);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/about.png',
                            color:
                            currentIndex == 1 ? Colors.blue : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 220,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          onTabTapped(2);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            border: currentIndex == 2
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/account.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 310,
                      top: 10,
                      child: InkWell(
                        onTap: () {
                          onTabTapped(3);
                        },
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            border: currentIndex == 3
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/logout.png',
                            color: Colors.white,
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
    );
  }
}
