import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'LoginPetugas/../login.dart';
import 'LoginPetugas/../login_option.dart';
import '../models.dart';
import 'LoginPetugas/../signup.dart';
import 'LoginPetugas/../signup_option.dart';

class WelcomePetugasPage extends StatefulWidget {
  @override
  _WelcomePetugasPageState createState() => _WelcomePetugasPageState();
}

class _WelcomePetugasPageState extends State<WelcomePetugasPage> {
  bool login = true;

  DateTime backButtonPressed;

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backButtonPressed == null ||
        currentTime.difference(backButtonPressed) > Duration(seconds: 3);
    if (backButton) {
      backButtonPressed = currentTime;
      Fluttertoast.showToast(
          msg: "Double Tap To Exit",
          backgroundColor: Colors.red,
          textColor: Colors.white);
      return false;
    }
    return exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: WillPopScope(
        onWillPop: onWillPop,
              child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    login = true;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  height: login
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.4,
                  child: CustomPaint(
                    painter: CurvePainter(login),
                    child: Container(
                      padding: EdgeInsets.only(bottom: login ? 0 : 55),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child: login ? SignInPetugasPages() : LoginPetugasOption(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    login = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                  height: login
                      ? MediaQuery.of(context).size.height * 0.4
                      : MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(top: login ? 55 : 0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child: !login ? SignUpPetugasPages() : SignUpPetugasOption(),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
