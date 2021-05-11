import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
          "HOMELAND",
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
          cursorColor: Colors.white,
          decoration: InputDecoration(
            icon: Icon(Icons.mail,color: Colors.white,),
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

        TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
            icon: Icon(Icons.lock,color: Colors.white),
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

        SizedBox(
          height: 24,
        ),

        Container(
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

        SizedBox(
          height: 16,
        ),
        
        Text(
          "FORGOT PASSWORD?",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1,
          ),
        ),
      ],
    );
  }
}
