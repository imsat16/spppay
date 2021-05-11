import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'package:spp_pay/UI/Dashboard/Admin/AdminPage.dart';
// import 'package:spp_pay/UI/Dashboard/Petugas/Petugas.dart';
// import 'package:spp_pay/UI/Dashboard/Siswa/DashboardSiswa.dart';

import 'Splashscreen.dart';

// Yang ada Lokasi link
// Siswa //
// Login
// Admin //
// Data Petugas
// Profile
// Petugas //
// Login,SignUp
// Dashboard //
// Profile
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dynamic token = FlutterSession().get('token');
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    home: token !=''?SplashApp() : MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPP-PAY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashApp(),
      // routes: <String, WidgetBuilder>{
      //   // '/DashboardAdmin': (BuildContext context) => AdminPage(),
      //   // '/DashboardPetugas': (BuildContext context) => Petugas(),
      //   // '/DashboardSiswa': (BuildContext context) => DahboardSiswa()
      // },
    );
  }
}
