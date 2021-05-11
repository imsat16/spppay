import 'package:flutter/material.dart';
import 'package:spp_pay/UI/Dashboard/Admin/AdminPage.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataPetugas/EditDataPetugas.dart';
import 'package:http/http.dart' as http;

class DetailPetugas extends StatefulWidget {
  List list;
  int index;
  DetailPetugas({this.list, this.index});
  @override
  _DetailPetugasState createState() => _DetailPetugasState();
}

class _DetailPetugasState extends State<DetailPetugas> {
  void deleteData() async {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com//deletePetugas.php");
    http.post(url, body: {"id": widget.list[widget.index]['id_petugas']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Text(
          "are u sure want to delete '${widget.list[widget.index]['nama_petugas']}'"),
      actions: [
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text("Ok Delete!"),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => AdminPage()));
          },
        ),
        RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("Cancel"),
            color: Colors.green,
            onPressed: () => Navigator.pop(context)),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("${widget.list[widget.index]['nama_petugas']}")),
      body: Container(
        height: 250,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nama : ${widget.list[widget.index]['nama_petugas']}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Username : @${widget.list[widget.index]['username']}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Pass : ${widget.list[widget.index]['password']}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Role : ${widget.list[widget.index]['role']}",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    EditDataPetugas(
                                      list: widget.list,
                                      index: widget.index,
                                    )))),
                    RaisedButton(
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () => confirm())
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
