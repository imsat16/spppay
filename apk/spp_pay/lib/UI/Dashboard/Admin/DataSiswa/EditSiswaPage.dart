import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spp_pay/UI/Dashboard/Admin/AdminPage.dart';

class EditSiswaPage extends StatefulWidget {
  final String idSiswa;
  final String nisSiswa;
  final String namaSiswa;
  final String siswaStatus;
  final String password;
  final String jenisKelamin;
  final String namaKelas;
  final String kompetensiKeahlian;
  final String noTelp;
  final String alamat;
  EditSiswaPage(
      {Key key,
      this.idSiswa,
      this.nisSiswa,
      this.namaSiswa,
      this.password,
      this.jenisKelamin,
      this.namaKelas,
      this.kompetensiKeahlian,
      this.noTelp,
      this.alamat,
      this.siswaStatus})
      : super(key: key);
  @override
  _EditSiswaPageState createState() => _EditSiswaPageState();
}

class _EditSiswaPageState extends State<EditSiswaPage> {
  TextEditingController nisn;
  TextEditingController nis;
  TextEditingController nama;
  TextEditingController kelas;
  TextEditingController jurusan;
  TextEditingController alamat;
  TextEditingController password;
  TextEditingController telp;
  TextEditingController status;
  // TextEditingController kelas = new TextEditingController();
  // TextEditingController jurusan = new TextEditingController();
  // TextEditingController jenkel = new TextEditingController();
  // TextEditingController status = new TextEditingController();
  @override
  void initState() {
    nisn = new TextEditingController(text: widget.idSiswa);
    nis = new TextEditingController(text: widget.nisSiswa);
    nama = new TextEditingController(text: widget.namaSiswa);
    kelas = new TextEditingController(text: widget.namaKelas);
    jurusan = new TextEditingController(text: widget.kompetensiKeahlian);
    alamat = new TextEditingController(text: widget.alamat);
    password = new TextEditingController(text: widget.password);
    telp = new TextEditingController(text: widget.noTelp);
    status = new TextEditingController(text: widget.siswaStatus);
    super.initState();
  }

  void editData() {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com//editDataSiswa.php");
    http.post(url, body: {
      "nisn": widget.idSiswa,
      "nis": nis.text,
      "nama_siswa": nama.text,
      "password": password.text,
      "alamat": alamat.text,
      "no_telp": telp.text,
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
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Text(
                  "Edit Data Siswa",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          controller: nisn,
                          decoration: InputDecoration(
                            labelText: 'NISN',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nis,
                          decoration: InputDecoration(
                            enabled: false,
                            labelText: 'NIS',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nama,
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(20.0),
                    //     ),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: password,
                    //       decoration: InputDecoration(
                    //         labelText: 'Password',
                    //         labelStyle: TextStyle(
                    //           color: Colors.black,
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //             width: 0,
                    //             style: BorderStyle.none,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: jenkel,
                    //       decoration: InputDecoration(
                    //           hintText: "Jenis Kelamin",
                    //           labelText: "Jenis Kelamin"),
                    //     ),
                    //   ),
                    // ),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: alamat,
                          decoration: InputDecoration(
                            labelText: 'Alamat',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: kelas,
                    //       decoration: InputDecoration(
                    //           hintText: "Kelas", labelText: "Kelas"),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: jurusan,
                    //       decoration: InputDecoration(
                    //           hintText: "Jurusan", labelText: "Jurusan"),
                    //     ),
                    //   ),
                    // ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: telp,
                          decoration: InputDecoration(
                            labelText: 'No Telp',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: status,
                    //       decoration: InputDecoration(
                    //           hintText: "Status Siswa",
                    //           labelText: "Status Siswa"),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            editData();
                            // Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AdminPage()));
                          },
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Edit Data Siswa",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    // Row(
                    //   children: [
                    //     Radio(
                    //       value: 1,
                    //       onChanged: (val) {}),
                    //     Text(
                    //       'ONE',
                    //       style: new TextStyle(fontSize: 17.0),
                    //     ),
                    //     Radio(
                    //       value: 1,
                    //       onChanged: (val) {}),
                    //     Text(
                    //       'ONE',
                    //       style: new TextStyle(fontSize: 17.0),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
