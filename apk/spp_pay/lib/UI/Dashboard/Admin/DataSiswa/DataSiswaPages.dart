import 'package:flutter/material.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/AddSiswaPage.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/KelasX.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/KelasXI.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/KelasXII.dart';

class DataSiswaPages extends StatefulWidget {
  @override
  _DataSiswaPagesState createState() => _DataSiswaPagesState();
}

class _DataSiswaPagesState extends State<DataSiswaPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  Text(
                    'Total Kelas aktif',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '0 Siswa',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tingkatan :',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => KelasXPage(),
                            ),
                          ),
                          child: Card(
                            child: Container(
                              width: 80,
                              height: 80,
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
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => KelasXIPage(),
                            ),
                          ),
                          child: Card(
                            child: Container(
                              width: 80,
                              height: 80,
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
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => KelasXIIPage(),
                            ),
                          ),
                          child: Card(
                            child: Container(
                              width: 80,
                              height: 80,
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
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Fitur Lainnya :',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 70,
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => AddSiswaPage(),
                            ),
                          ),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 35,
                                color: Colors.blue[300],
                              ),
                              Text(
                                ' Tambah Siswa',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.white,
                          child: Row(
                            children: [
                              Icon(
                                Icons.collections_bookmark_outlined,
                                size: 35,
                                color: Colors.blue[300],
                              ),
                              Text(
                                ' Data Kelas',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 70,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.white,
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_up,
                                size: 35,
                                color: Colors.blue[300],
                              ),
                              Text(
                                ' Naik Kelas',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
