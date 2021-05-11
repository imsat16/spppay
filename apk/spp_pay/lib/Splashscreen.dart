import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:spp_pay/UI/Dashboard/Admin/AdminPage.dart';
import 'package:spp_pay/UI/Dashboard/Petugas/PetugasPage.dart';
import 'package:spp_pay/UI/Login/LoginSiswa/UtamaSiswa.dart';

class SplashApp extends StatefulWidget {
  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    dynamic token = await FlutterSession().get('token');
    var duration = Duration(seconds: 3);
    if (token == null || token == '') {
      return Timer(duration, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeSiswaPage()),
        );
        print(token);
      });
    } else if (token != null || token != '') {
      if (token == 'admin') {
        return Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminPage()),
          );
          print(token);
        });
      } else if (token == 'petugas') {
        return Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetugasPage()),
          );
          print(token);
        });
      } else {
        return Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WelcomeSiswaPage()),
          );
          print(token);
        });
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/logo.png',width: 100,)),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return SplashScreen(
  //     seconds: 5,
  //     navigateAfterSeconds: WelcomePage(),
  //     imageBackground: Image.asset("assets/images/spp  -pay-splash-2.png").image,
  //     // backgroundColor: ColorPalette.blueGrotto,
  //     useLoader: false,
  //     // loaderColor: ColorPalette.skyBlue,
  //     // loadingText: Text(
  //     //   "loading...",
  //     //   style: TextStyle(color: Colors.pink),
  //     // ),
  //   );
  // }
}
