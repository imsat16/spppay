import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataPetugas extends StatefulWidget {
  @override
  _AddDataPetugasState createState() => _AddDataPetugasState();
}

class _AddDataPetugasState extends State<AddDataPetugas> {
  String msg = '';
  TextEditingController controllerNamaLengkap = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  Future addDataAdmin() async {
    Uri url =
        Uri.parse("https://spppay1.000webhostapp.com//add_data_admin.php");
    http.post(url, body: {
      "nama_petugas": controllerNamaLengkap.text,
      "username": controllerUsername.text,
      "password": controllerPassword.text,
    });
    // var datauser = json.decode(response.body);
    // if (datauser == 'Berhasil') {
    //   setState(() {
    //     msg = "Check your usename & password";
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        children: [
          Column(
            children: [
              TextField(
                controller: controllerNamaLengkap,
                decoration: InputDecoration(
                  hintText: "Nama Lengkap",
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: controllerUsername,
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info),
                      Text(' Input Data ini hanya untuk tambah admin')
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      addDataAdmin();
                      Navigator.pop(context);
                    },
                    child: Text('Tambah'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Row(
              //       children: [
              //         Radio(value: 1, groupValue: null, onChanged: null),
              //         Text('ADMIN')
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Radio(value: null, groupValue: null, onChanged: null),
              //         Text('PETUGAS')
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
