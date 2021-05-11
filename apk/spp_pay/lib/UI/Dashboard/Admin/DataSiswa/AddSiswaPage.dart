import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddSiswaPage extends StatefulWidget {
  @override
  _AddSiswaPageState createState() => _AddSiswaPageState();
}

class _AddSiswaPageState extends State<AddSiswaPage> {
  TextEditingController nisn = new TextEditingController();
  TextEditingController nis = new TextEditingController();
  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController password = new TextEditingController();
  // TextEditingController thn_ajaran = new TextEditingController();
  // TextEditingController kelas = new TextEditingController();
  // TextEditingController kelas = new TextEditingController();
  // TextEditingController jurusan = new TextEditingController();
  // TextEditingController jenkel = new TextEditingController();
  TextEditingController noTelp = new TextEditingController();
  // TextEditingController status = new TextEditingController();
  String _jenkel = "";
  void _pilihKls(String value) {
    setState(() {
      _jenkel = value;
    });
  }

  void initState() {
    super.initState();
    getKelas();
  }

  List kelas = ["KLS0000001"];
  String sebelumkelas;
  String hasilKelas = "";
  List dataKelas = List(); //edited line

  Future<String> getKelas() async {
    Uri getkelas = Uri.parse("https://spppay1.000webhostapp.com/getDataKelas.php");
    final responseKelas = await http.post(getkelas, body: {});

    var getdataKelas = json.decode(responseKelas.body);
    setState(() {
      dataKelas = getdataKelas;
    });
    return "Sucess";
  }

  void tambahData() {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com/addDataSiswa.php");
    http.post(url, body: {
      "nisn": nisn.text,
      "nis": nis.text,
      "nama_siswa": nama.text,
      "password": password.text,
      "alamat": alamat.text,
      "no_telp": noTelp.text,
      // "thn": thn_ajaran.text,
      "id_kelas": '$hasilKelas',
      "jenkel": _jenkel,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back))),
                  // SizedBox(width:50),
                  Padding(padding: const EdgeInsets.only(right: 50)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Text(
                  "Tambah Data Siswa",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Data Siswa",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nisn,
                          decoration: InputDecoration(
                              hintText: "NISN", labelText: "NISN"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nis,
                          decoration: InputDecoration(
                              hintText: "NIS", labelText: "NIS"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nama,
                          decoration: InputDecoration(
                              hintText: "Nama", labelText: "Nama"),
                        ),
                      ),
                    ),
                    Card(
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jenis Kelamin"),
                              Column(
                                children: [
                                  RadioListTile(
                                    value: "Pria",
                                    title: Text("Pria"),
                                    groupValue: _jenkel,
                                    onChanged: (String value) {
                                      _pilihKls(value);
                                    },
                                    activeColor: Colors.greenAccent,
                                  ),
                                  RadioListTile(
                                    value: "Wanita",
                                    title: Text("Wanita"),
                                    groupValue: _jenkel,
                                    onChanged: (String value) {
                                      _pilihKls(value);
                                    },
                                    activeColor: Colors.greenAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text(
                          "Kelas & Jurusan",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        value: sebelumkelas,
                        items: dataKelas.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(
                                item['nama_kelas'] + ' ' + item['kompetensi_keahlian']),
                            value: item['id_class'].toString(),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            sebelumkelas = value;
                            hasilKelas = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: alamat,
                    decoration: InputDecoration(
                        hintText: "Alamat", labelText: "Alamat"),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: noTelp,
                    decoration: InputDecoration(
                        hintText: "No Telp", labelText: "No Telp"),
                  ),
                ),
              ),
              // Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: TextField(
              //       controller: thn_ajaran,
              //       decoration: InputDecoration(
              //           hintText: "Tahun Ajaran", labelText: "Tahun Ajaran"),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 20),
                child: Text(
                  "Account Siswa",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: "Password", labelText: "Password"),
                  ),
                ),
              ),
              SizedBox(height: 35),
              RaisedButton(
                onPressed: () {
                  tambahData();
                  Navigator.pop(context);
                },
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 13,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Tambah Data Siswa",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
