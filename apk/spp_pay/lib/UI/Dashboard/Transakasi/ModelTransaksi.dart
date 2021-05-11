import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Posts {
  final String idPetugas;
  final String username;
  final String namaPetugas;
  final String role;

  Posts({this.idPetugas, this.username, this.namaPetugas, this.role,});

  factory Posts.fromJson(Map <String,dynamic> json){
    return Posts(
      idPetugas: json['id_petugas'],
      username: json['username'],
      namaPetugas: json['nama_petugas'],
      role: json['role'],
    );
  }

}
