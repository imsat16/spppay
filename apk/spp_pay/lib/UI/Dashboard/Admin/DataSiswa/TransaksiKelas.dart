import 'package:flutter/material.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/KelasX.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/KelasXI.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/KelasXII.dart';

class TransaksiKelas extends StatefulWidget {
  @override
  _TransaksiKelasState createState() => _TransaksiKelasState();
}

class _TransaksiKelasState extends State<TransaksiKelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                 onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => KelasXPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        'X',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => KelasXIPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        'XI',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => KelasXIIPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        'XII',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
