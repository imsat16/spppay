import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {

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
          decoration: InputDecoration(
            icon: Icon(Icons.person,color: Colors.blue),
            labelText: 'Full name',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0, 
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
          decoration: InputDecoration(
            icon: Icon(Icons.email,color: Colors.blue),
            labelText: 'Enter Email / Username',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0, 
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
          decoration: InputDecoration(
            icon: Icon(Icons.lock,color: Colors.blue),
            labelText: 'Password',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
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

        Container(
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
          child:  Center(
            child: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }
}