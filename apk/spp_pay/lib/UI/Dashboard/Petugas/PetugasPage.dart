import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spp_pay/UI/Dashboard/Admin/dashboard.dart';
import 'package:spp_pay/UI/Dashboard/Profile.dart';

class PetugasPage extends StatefulWidget {
  @override
  _PetugasPageState createState() => _PetugasPageState();
}

String nama = '';

class _PetugasPageState extends State<PetugasPage> {
  DateTime backButtonPressed;

  @override
  void initState() {
    super.initState();
    namaUser();
  }

  void namaUser() async {
    setState(() async {
      dynamic nama = await FlutterSession().get('nama');
    });
  }

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
    Color primaryColor = Colors.blue;
    // .fromRGBO(255, 82, 48, 1);

    return Scaffold(
      // backgroundColor: Colors.blue,
      // .fromRGBO(244, 244, 244, 1),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      border: Border.all(color: primaryColor)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FutureBuilder(
                          future: FlutterSession().get('nama'),
                          builder: (context, snapshot) {
                            return Text(
                              snapshot.hasData ? snapshot.data : "Loading",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                          //                     child: Text(
                          //   "asdasdasd",
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold),
                          // ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            // child: Icon(Icons.account_circle_outlined),
                            backgroundImage:
                                AssetImage('assets/images/jobs.jpg'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      height: 350.0,
                      decoration: BoxDecoration(color: primaryColor),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '2800,00',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Avalilable Balance',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FutureBuilder(
                              future: FlutterSession().get('nama'),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.hasData
                                      ? snapshot.data
                                      : "Loading",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 170.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0.0, 3.0),
                                blurRadius: 15.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.green.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.send),
                                        color: Colors.green,
                                        iconSize: 30.0,
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Bayar',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color: Colors.deepPurple.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.receipt_long),
                                        color: Colors.deepPurple,
                                        iconSize: 30.0,
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Laporan',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      color:
                                          Colors.purpleAccent.withOpacity(0.1),
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.info_outline),
                                        color: Colors.purpleAccent,
                                        iconSize: 30.0,
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Information',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                child: Text(
                  'Latest',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: UpcomingCard(
                          title: 'Nama Siswa',
                          value: 280.0,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: UpcomingCard(
                          title: 'Cred Card Two',
                          value: 280.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: UpcomingCard(
                          title: 'Cred Card Three',
                          value: 280.0,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: UpcomingCard(
                          title: 'Cred Card Three',
                          value: 280.0,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              Text('$value',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
