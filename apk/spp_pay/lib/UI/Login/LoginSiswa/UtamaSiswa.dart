import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';

class WelcomeSiswaPage extends StatefulWidget {
  @override
  _WelcomeSiswaPageState createState() => _WelcomeSiswaPageState();
}

class _WelcomeSiswaPageState extends State<WelcomeSiswaPage> {
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
      backgroundColor: Colors.blue,
      body: Center(
        child: WillPopScope(
          onWillPop: onWillPop,
                child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32),
                      child: SignInSiswaPages(),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
