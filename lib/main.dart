import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.ralewayTextTheme(
        Theme.of(context).textTheme,
      )),
      home: Scaffold(
        body: Container(
          child: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  Color _backgroundColor = Colors.white;
  Color _headingColor = Colors.grey;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _loginWidth = 0;
  double _loginOpacity = 1;
  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Colors.grey;
        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        break;
      case 1:
        _backgroundColor = const Color(0XFF79BC4E);
        _headingColor = Colors.white;
        _loginYOffset = 200;
        _registerYOffset = windowHeight;
        _loginXOffset = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        break;
      case 2:
        _backgroundColor = Color(0XFF3AAA35);
        _headingColor = Colors.white;
        _loginYOffset = 170;
        _registerYOffset = 200;
        _loginXOffset = 20;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.80;
    }

    return SafeArea(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            color: _backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    _pageState = 0;
                  }),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 64.0, left: 36.0, right: 36.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Welcome to this Test App.',
                            style:
                                TextStyle(fontSize: 28, color: _headingColor),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Lorem ipsum is so out of date. Instead, I have written a fancy description text all by myself! Cool, right?",
                            style:
                                TextStyle(fontSize: 16, color: _headingColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 36),
                  child: SvgPicture.asset('assets/Test.svg'),
                  height: 400,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _pageState = 1;
                    print(_pageState);
                  }),
                  child: Container(
                    margin: EdgeInsets.all(24),
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(32)),
                    child: Text(
                      'Get started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              _pageState = 2;
            }),
            child: AnimatedContainer(
              width: _loginWidth,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1100),
              transform:
                  Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_loginOpacity),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  PrimaryButton(),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              _pageState = 1;
            }),
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1100),
              transform: Matrix4.translationValues(0, _registerYOffset, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({Key? key}) : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text('Get Started'),
      ),
    );
  }
}
