import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spp_pay/UI/Dashboard/Transakasi/ModelTransaksi.dart';
import 'package:http/http.dart' as http;

class SearchTransaksi extends StatefulWidget {
  @override
  _SearchTransaksiState createState() => _SearchTransaksiState();
}

class _SearchTransaksiState extends State<SearchTransaksi> {
  List<Posts> _list = [];
  List<Posts> _search = [];
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    Uri url =
        Uri.parse("https://spppay1.000webhostapp.com//getDataPetugas.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Posts.fromJson(i));
          loading = false;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
