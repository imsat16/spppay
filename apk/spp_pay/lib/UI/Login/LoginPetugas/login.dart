import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:spp_pay/UI/Dashboard/Admin/AdminPage.dart';
import 'package:spp_pay/UI/Dashboard/Petugas/PetugasPage.dart';
import 'package:spp_pay/UI/Login/LoginSiswa/UtamaSiswa.dart';

class SignInPetugasPages extends StatefulWidget {
  @override
  _SignInPetugasPagesState createState() => _SignInPetugasPagesState();
}

class _SignInPetugasPagesState extends State<SignInPetugasPages> {
  bool _isHidden = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  String name;
  String msg = '';

  Future _login() async {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com//login.php");
    // Uri url = Uri.parse("https://spppay1.000webhostapp.com//login.php");
    final response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });
    var datauser = json.decode(response.body);
    print(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Check your usename & password";
      });
    } else {
      if (datauser != "gagal") {
        await FlutterSession().set('token', datauser[0]['role']);
        await FlutterSession().set('id', datauser[0]['id_petugas']);
        await FlutterSession().set('nama', datauser[0]['nama_petugas']);

        if (datauser[0]['role'] == 'admin') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AdminPage()));
        } else if (datauser[0]['role'] == 'petugas') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PetugasPage()));
        }
      } else {
        print("failed");
      }
    }
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              "(Login Petugas)",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 1,
              ),
            ),
          ],
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
          style: TextStyle(color: Colors.white),
          controller: username,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            icon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            labelText: 'Email / Username',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.blue[600],
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          child: TextField(
            obscureText: _isHidden,
            style: TextStyle(color: Colors.white),
            controller: password,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  Icons.visibility,
                  color: _isHidden ? Colors.white : Colors.grey,
                ),
              ),
              icon: Icon(Icons.lock, color: Colors.white),
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: Colors.blue[600],
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                msg,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
          ),
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
                        builder: (context) => WelcomeSiswaPage()));
              },
              child: Text(
                "LOGIN AS STUDENT'S ?",
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
      ],
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
