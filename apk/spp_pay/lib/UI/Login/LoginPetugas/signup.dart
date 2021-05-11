import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spp_pay/UI/Login/LoginPetugas/UtamaPetugas.dart';

class SignUpPetugasPages extends StatefulWidget {
  @override
  _SignUpPetugasPagesState createState() => _SignUpPetugasPagesState();
}

class _SignUpPetugasPagesState extends State<SignUpPetugasPages> {
  String msg = '';
  bool _isHidden = true;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  Future addData() async {
    Uri url =
        Uri.parse("https://spppay1.000webhostapp.com//add_data_petugas.php");
    final response = await http.post(url, body: {
      "nama_petugas": controllerName.text,
      "username": controllerUsername.text,
      "password": controllerPassword.text,
    });
    var datauser = json.decode(response.body);
    if (datauser == 'Berhasil') {
      setState(() {
        msg = "Check your usename & password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            letterSpacing: 2,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: controllerName,
          cursorColor: Colors.blue,
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            icon: Icon(Icons.person, color: Colors.blue),
            labelText: 'Full name',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 1,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: controllerUsername,
          cursorColor: Colors.blue,
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            icon: Icon(Icons.email, color: Colors.blue),
            labelText: 'Enter Email / Username',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 1,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          controller: controllerPassword,
          obscureText: _isHidden,
          cursorColor: Colors.blue,
          style: TextStyle(color: Colors.blue),
          decoration: InputDecoration(
            icon: Icon(Icons.lock, color: Colors.blue),
            labelText: 'Password',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 1,
                style: BorderStyle.none,
              ),
            ),
            suffix: InkWell(
              onTap: _togglePasswordView,
              child: Icon(
                Icons.visibility,
                color: _isHidden ? Colors.blue : Colors.grey,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        InkWell(
          onTap: () {
            addData();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WelcomePetugasPage()));
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "SIGN UP",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
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
