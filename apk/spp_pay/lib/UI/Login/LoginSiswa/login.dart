import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:spp_pay/UI/Dashboard/Siswa/SiswaPage.dart';
import 'package:spp_pay/UI/Login/LoginPetugas/UtamaPetugas.dart';

class SignInSiswaPages extends StatefulWidget {
  @override
  _SignInSiswaPagesState createState() => _SignInSiswaPagesState();
}

class _SignInSiswaPagesState extends State<SignInSiswaPages> {
  bool _isHidden = true;
  TextEditingController nisController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String name;
  String msg = '';

  Future _login() async {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com/login_siswa.php");
    final response = await http.post(
      url,
      body: {
        "nis": nisController.text,
        "password": passwordController.text,
      },
    );
    print(response.body);
    var datauser = json.decode(response.body);
    await FlutterSession().set('nama', datauser[0]['nama_siswa']);

    if (datauser.length == 0) {
      setState(
        () {
          Fluttertoast.showToast(
              msg: "Check your usename & password",
              backgroundColor: Colors.red,
              textColor: Colors.white);
        },
      );
    } else {
      await FlutterSession().set('token', 'siswa');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SiswaPage(),
        ),
      );
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            height: 2,
          ),
        ),
        Text(
          "SPP PAY",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
            height: 1,
          ),
        ),
        Text(
          "Please login to continue",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: nisController,
          cursorColor: Colors.blue,
          // style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            icon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            labelText: 'NIS',
            labelStyle: TextStyle(color: Colors.black, fontSize: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          child: TextField(
            obscureText: _isHidden,
            // style: TextStyle(color: Colors.black),
            controller: passwordController,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white),
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black, fontSize: 18),
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  Icons.visibility,
                  color: _isHidden ? Colors.grey : Colors.blue,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              msg,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            _login();
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WelcomePetugasPage()));
              },
              child: Text(
                "LOGIN AS Officer ?",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ),
            Text(
              "FORGOT PASSWORD ?",
              style: TextStyle(
                fontSize: 13,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
            ),
          ],
        ),
        // TextButton(
        //   onPressed: () {
        //      Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => WelcomePetugasPage()));
        //   },
        //   child: Text(
        //     "LOGIN AS Officer ?",
        //     style: TextStyle(
        //       fontSize: 15,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white,
        //       height: 1,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
