import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spp_pay/UI/Dashboard/Admin/DataPetugas/AddDataPetugas.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataPetugas/DetailPetugas.dart';

class DataPetugas extends StatefulWidget {
  @override
  _DataPetugasState createState() => _DataPetugasState();
}

class _DataPetugasState extends State<DataPetugas> {
  Future getData() async {
    Uri url =
        Uri.parse("https://spppay1.000webhostapp.com//getDataPetugas.php");
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Petugas'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddDataPetugas()));
        },
      ),
      body: RefreshIndicator(
        onRefresh: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) => DataPetugas(),
              transitionDuration: Duration(seconds: 2),
            ),
          );
          return Future.value(false);
        },
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            {}
            return snapshot.hasData
                ? ItemList(
                    list: snapshot.data,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => DetailPetugas(
                  list: list,
                  index: i,
                ),
              ),
            ),
            child: Card(
              child: ListTile(
                title: Text(list[i]['nama_petugas']),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/jobs.jpg'),
                ),
                subtitle: Text("Role : ${list[i]['role']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
