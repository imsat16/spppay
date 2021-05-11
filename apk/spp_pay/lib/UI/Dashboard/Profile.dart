import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:spp_pay/UI/Login/LoginPetugas/UtamaPetugas.dart';
import 'package:http/http.dart' as http;
// import 'package:spp_pay/UI/Login/login.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    getProfile();
  }

  String roleProfile = "";
  String namaProfile = "";
  String usernameProfile = "";
  Future getProfile() async {
    dynamic token = await FlutterSession().get("id");
    Uri url = Uri.parse("https://spppay1.000webhostapp.com/getProfile.php");
    final response = await http.post(url, body: {
      "id": token.toString(),
    });
    var datauser = json.decode(response.body);
    setState(() {
      roleProfile = datauser[0]['role'].toString();
      namaProfile = datauser[0]['nama_petugas'].toString();
      usernameProfile = datauser[0]['username'].toString();
      // nama_profile = nama.toString();
      // username_profile = username.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        // backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Profile
                  Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 3.0),
                            blurRadius: 15.0)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.blue.withOpacity(0.1),
                              child: IconButton(
                                padding: EdgeInsets.all(15.0),
                                icon: Icon(Icons.person),
                                color: Colors.blue,
                                iconSize: 50.0,
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 8.0),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: BorderSide(color: Colors.blue, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              // color: Colors.green,
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Nama
                  Container(
                    width: 270,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 3.0),
                            blurRadius: 15.0)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Nama',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Username ',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Role',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  ': ' + '$namaProfile',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ': ' + '$usernameProfile',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ': ' + '$roleProfile',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                  child: Text("Logout"),
                  onPressed: () {
                    FlutterSession().set(
                      'token',
                      '',
                    );
                    FlutterSession().set(
                      'username',
                      '',
                    );
                    FlutterSession().set(
                      'nama',
                      '',
                    );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomePetugasPage()));
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
