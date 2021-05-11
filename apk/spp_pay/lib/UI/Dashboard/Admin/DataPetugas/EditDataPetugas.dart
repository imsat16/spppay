import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditDataPetugas extends StatefulWidget {
  final List list;
  final int index;
  EditDataPetugas({this.list, this.index});
  @override
  _EditDataPetugasState createState() => _EditDataPetugasState();
}

class _EditDataPetugasState extends State<EditDataPetugas> {
  TextEditingController controllerNamaLengkap;
  TextEditingController controllerUsername;
  TextEditingController controllerPassword;
  TextEditingController controllerRole;
  void editDataPetugas() {
    Uri url1 =
        Uri.parse("https://spppay1.000webhostapp.com//editDataPetugas.php");
    var url = url1;
    http.post(url, body: {
      "id_petugas": widget.list[widget.index]['id_petugas'],
      "nama_petugas": controllerNamaLengkap.text,
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "role": controllerRole.text,
    });
  }

  @override
  void initState() {
    controllerNamaLengkap =
        TextEditingController(text: widget.list[widget.index]['nama_petugas']);
    controllerUsername =
        TextEditingController(text: widget.list[widget.index]['username']);
    controllerPassword =
        TextEditingController(text: widget.list[widget.index]['password']);
    controllerRole =
        TextEditingController(text: widget.list[widget.index]['role']);
    super.initState();
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
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: controllerRole,
                decoration: InputDecoration(
                  hintText: "Admin / Petugas",
                  labelText: "Role",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    onPressed: () {
                      editDataPetugas();
                      Navigator.pop(context);
                    },
                    child: Text('Update'),
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
