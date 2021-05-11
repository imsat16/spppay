import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/DetailSiswaPage.dart';

class KelasXIIPage extends StatefulWidget {
  @override
  _KelasXIIPageState createState() => _KelasXIIPageState();
}

class _KelasXIIPageState extends State<KelasXIIPage> {
  List _dataSiswa = List();
  String kelasXII = "XII";
  void getData() async {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com//getDataSiswa.php");
    var response = await http.post(url, body: {"nama_kelas": kelasXII});
    setState(() {
      _dataSiswa = json.decode(response.body);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

   SingleChildScrollView _tabelData() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Card(
          child: DataTable(
            dataRowHeight: 80,
            columns: [
              // DataColumn(label: Text("NISN")),
              DataColumn(label: Text("Nama")),
              // DataColumn(label: Text("Kelas")),
              DataColumn(label: Text("NIS")),
              DataColumn(label: Text("Jurusan")),
              DataColumn(label: Text("Action")),
            ],
            rows: _dataSiswa
                .map(
                  (item) => DataRow(
                    cells: <DataCell>[
                      // DataCell(Text(item["nisn"])),
                      DataCell(Text(item["nama_siswa"])),
                      // DataCell(Text(item["nama_kelas"])),
                      DataCell(Text(item["nis"])),
                      DataCell(Text(item["kompetensi_keahlian"])),
                      DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailSiswaPage(
                                    idSiswa: item['nisn'],
                                    nisSiswa: item['nis'],
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.monetization_on,
                              size: 25,
                              color: Colors.green,
                            ),
                            Text(
                              'Bayar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (a, b, c) => KelasXIIPage(),
                transitionDuration: Duration(seconds: 2)),
          );
          return Future.value(false);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  // SizedBox(width:50),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 40),
              child: Text(
                "Data Siswa Kelas XII",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            SizedBox(height: 20),
            Center(child: _tabelData())
          ]),
        ),
      ),
    );
  }
}
