import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:spp_pay/UI/Dashboard/Admin/AdminPage.dart';
import 'package:spp_pay/UI/Dashboard/Admin/Bayar.dart';
import 'package:spp_pay/UI/Dashboard/Admin/DataSiswa/EditSiswaPage.dart';
import 'package:spp_pay/UI/Dashboard/Admin/Invoice.dart';

class DetailSiswaPage extends StatefulWidget {
  final String idSiswa;
  final String nisSiswa;
  final String namaSiswa;

  DetailSiswaPage({Key key, this.idSiswa, this.nisSiswa, this.namaSiswa})
      : super(key: key);
  // List list;
  // int index;
  // DetailSiswaPage({this.index,this.list});

  @override
  _DetailSiswaPageState createState() => _DetailSiswaPageState();
}

class _DetailSiswaPageState extends State<DetailSiswaPage> {
  void initState() {
    super.initState();
    siswaDetail();
  }

  String nisn = "";
  String nis = "";
  String nama = "";
  String password = "";
  String jenisKelamin = "";
  String namaKelas = "";
  String kompetensiKeahlian = "";
  String alamat = "";
  String noTelp = "";
  String siswaStatus = "";
  String tagihan = "";

  void siswaDetail() async {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com//detailSiswa.php");
    final response = await http.post(url, body: {
      "nisn": widget.idSiswa,
    });

    var data = json.decode(response.body);
    setState(() {
      nisn = data[0]['nisn'];
      nis = data[0]['nis'];
      nama = data[0]['nama_siswa'];
      password = data[0]['password'];
      jenisKelamin = data[0]['jenis_kelamin'];
      namaKelas = data[0]['nama_kelas'];
      kompetensiKeahlian = data[0]['kompetensi_keahlian'];
      noTelp = data[0]['no_telp'];
      alamat = data[0]['alamat'];
      siswaStatus = data[0]['siswa_status'];
    });
  }

  Future<List> tagihanSiswa() async {
    Uri uriTagihan =
        Uri.parse("https://spppay1.000webhostapp.com/detailTagihan.php");
    final responseTagihan = await http.post(uriTagihan, body: {
      "nisn": widget.idSiswa,
    });
    dynamic hasilTagihan = json.decode(responseTagihan.body);
    if (hasilTagihan != null) {
      setState(() {
        tagihan = hasilTagihan.toString();
      });
    } else {
      setState(() {
        tagihan = "null";
      });
    }
    return hasilTagihan;
  }

  void deleteSiswa() {
    Uri url = Uri.parse("https://spppay1.000webhostapp.com//deleteSiswa.php");
    http.post(url, body: {"nisn": widget.idSiswa, "nis": widget.nisSiswa});
  }

  //   void deleteSiswaUser(){
  //   var url="http://192.168.137.65/spp_app/delete_siswa.php";
  //   http.post(url,body:{
  //   });
  // }
  // AlertDialog alertDialog = AlertDialog(
  //   content: Text("Yakin Ingin Menghapus Data '${widget.nama_siswa}'"),
  //   actions: <Widget>[
  //     RaisedButton(
  //       child: Row(
  //         children: [
  //           Text("Delete"),
  //           Icon(FontAwesomeIcons.sadCry)
  //         ],
  //       ),
  //       color: Colors.redAccent,
  //       onPressed: (){},),
  //     RaisedButton(
  //       child: Row(
  //         children: [
  //           Text("Cancel"),
  //           Icon(FontAwesomeIcons.smileBeam)
  //         ],
  //       ),
  //       color: Colors.greenAccent,
  //       onPressed: (){},)
  //   ],
  // );
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Hapus Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Yakin Ingin Menghapus?',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                SizedBox(height: 5),
                Text(
                  "$nama",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text("Delete"),
                  // SizedBox(width:10),
                  // Icon(FontAwesomeIcons.sadCry,size: 15,)
                ],
              ),
              color: Colors.redAccent,
              onPressed: () {
                deleteSiswa();
                // deleteSiswaUser();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AdminPage()));
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  // Icon(FontAwesomeIcons.smileBeam)
                ],
              ),
              color: Colors.green,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(centerTitle: true,title: Text("${widget.list[widget.index]['nama_siswa']}"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.all(20.0),
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
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ))),
              // SizedBox(width:50),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$nama",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Row(
                  children: [
                    // IconButton(
                    //   onPressed: () =>
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (BuildContext context) => EditSiswaPage(
                    //                 idSiswa: widget.idSiswa,
                    //                 nisSiswa: widget.nisSiswa,
                    //                 namaSiswa: '$nama',
                    //                 alamat: '$alamat',
                    //                 jenisKelamin: '$jenisKelamin',
                    //                 namaKelas: '$namaKelas',
                    //                 kompetensiKeahlian: '$kompetensiKeahlian',
                    //                 siswaStatus: '$siswaStatus',
                    //                 password: '$password',
                    //                 noTelp: '$noTelp',
                    //               ))),
                    //   icon: Icon(
                    //     Icons.edit,
                    //     size: 20,
                    //   ),
                    // ),
                    IconButton(
                        onPressed: () => _showMyDialog(),
                        // => Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => HapusSiswa())),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        )),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          offset: Offset(0.0, 3.0),
                          blurRadius: 15.0)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.blue.withOpacity(0.1),
                            child: IconButton(
                              padding: EdgeInsets.all(15.0),
                              icon: Icon(Icons.person),
                              color: Colors.blue,
                              iconSize: 50.0,
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(height: 8.0),
                          OutlinedButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        EditSiswaPage(
                                          idSiswa: widget.idSiswa,
                                          nisSiswa: widget.nisSiswa,
                                          namaSiswa: '$nama',
                                          alamat: '$alamat',
                                          jenisKelamin: '$jenisKelamin',
                                          namaKelas: '$namaKelas',
                                          kompetensiKeahlian:
                                              '$kompetensiKeahlian',
                                          siswaStatus: '$siswaStatus',
                                          password: '$password',
                                          noTelp: '$noTelp',
                                        ))),
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: BorderSide(color: Colors.blue, width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            // color: Colors.green,
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "NISN",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        "NIS",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Kelas",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Alamat",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      child: Text(
                        "No telp",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " : $nisn",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      " : $nis",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      " : $jenisKelamin",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      " : $namaKelas",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      " : $alamat",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      " : $noTelp",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Pilih Tagihan Pembayar',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 170.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0.0, 3.0),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keterangan :',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.layers,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Warna hijau menandai lunas',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.layers,
                              color: Colors.yellow[700],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Warna Kuning menandai belum lunas',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.layers,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Warna Merah menandai belum dibayar',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[700]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(25.0),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder<List>(
                              future: tagihanSiswa(),
                              builder: (context, snapshot) {
                                return snapshot.hasData
                                    ? new TagihanSiswaView(
                                        tagihan: snapshot.data,
                                        nisnData: '$nisn')
                                    : new Center(
                                        child: new CircularProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.blue),
                                        ),
                                      );
                              })
                        ])),
                // Container(
                //   width: double.infinity,
                //   height: 370.0,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black.withOpacity(0.1),
                //         offset: Offset(0.0, 3.0),
                //         blurRadius: 15.0,
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'SPP Tahun Ajaran',
                //           style: TextStyle(
                //               fontSize: 20, fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class TagihanSiswaView extends StatelessWidget {
  final List tagihan;
  final String nisnData;
  TagihanSiswaView({this.tagihan, this.nisnData});
  var tagihanTextStyle = TextStyle(
      fontFamily: "Montserrat Medium", fontSize: 15, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: tagihan == null ? 0 : tagihan.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        Color colorJanuari;
        if (int.parse(tagihan[i]['spp_januari']) == 300000) {
          colorJanuari = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_januari']) == 0) {
          colorJanuari = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_januari']) < 300000) {
          colorJanuari = Color(0xFFFCE205);
        } else {
          colorJanuari = Colors.white;
        }

        Color colorFebruari;
        if (int.parse(tagihan[i]['spp_februari']) == 300000) {
          colorFebruari = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_februari']) == 0) {
          colorFebruari = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_februari']) < 300000) {
          colorFebruari = Color(0xFFFCE205);
        } else {
          colorJanuari = Colors.white;
        }

        Color colorMaret;
        if (int.parse(tagihan[i]['spp_maret']) == 300000) {
          colorMaret = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_maret']) == 0) {
          colorMaret = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_maret']) < 300000) {
          colorMaret = Color(0xFFFCE205);
        } else {
          colorJanuari = Colors.white;
        }

        Color colorApril;
        if (int.parse(tagihan[i]['spp_april']) == 300000) {
          colorApril = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_april']) == 0) {
          colorApril = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_april']) < 300000) {
          colorApril = Color(0xFFFCE205);
        } else {
          colorJanuari = Colors.white;
        }

        Color colorMei;
        if (int.parse(tagihan[i]['spp_mei']) == 300000) {
          colorMei = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_mei']) == 0) {
          colorMei = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_mei']) < 300000) {
          colorMei = Color(0xFFFCE205);
        } else {
          colorMei = Colors.white;
        }

        Color colorJuni;
        if (int.parse(tagihan[i]['spp_juni']) == 300000) {
          colorJuni = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_juni']) == 0) {
          colorJuni = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_juni']) < 300000) {
          colorJuni = Color(0xFFFCE205);
        } else {
          colorJuni = Colors.white;
        }

        Color colorJuli;
        if (int.parse(tagihan[i]['spp_juli']) == 300000) {
          colorJuli = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_juli']) == 0) {
          colorJuli = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_juli']) < 300000) {
          colorJuli = Color(0xFFFCE205);
        } else {
          colorJuli = Colors.white;
        }

        Color colorAgustus;
        if (int.parse(tagihan[i]['spp_agustus']) == 300000) {
          colorAgustus = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_agustus']) == 0) {
          colorAgustus = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_agustus']) < 300000) {
          colorAgustus = Color(0xFFFCE205);
        } else {
          colorAgustus = Colors.white;
        }

        Color colorSeptember;
        if (int.parse(tagihan[i]['spp_september']) == 300000) {
          colorSeptember = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_september']) == 0) {
          colorSeptember = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_september']) < 300000) {
          colorSeptember = Color(0xFFFCE205);
        } else {
          colorSeptember = Colors.white;
        }

        Color colorOktober;
        if (int.parse(tagihan[i]['spp_oktober']) == 300000) {
          colorOktober = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_oktober']) == 0) {
          colorOktober = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_oktober']) < 300000) {
          colorOktober = Color(0xFFFCE205);
        } else {
          colorOktober = Colors.white;
        }

        Color colorNovember;
        if (int.parse(tagihan[i]['spp_november']) == 300000) {
          colorNovember = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_november']) == 0) {
          colorNovember = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_november']) < 300000) {
          colorNovember = Color(0xFFFCE205);
        } else {
          colorNovember = Colors.white;
        }

        Color colorDesember;
        if (int.parse(tagihan[i]['spp_desember']) == 300000) {
          colorDesember = Colors.yellow;
        } else if (int.parse(tagihan[i]['spp_desember']) == 0) {
          colorDesember = Colors.blue[300];
        } else if (int.parse(tagihan[i]['spp_desember']) < 300000) {
          colorDesember = Color(0xFFFCE205);
        } else {
          colorDesember = Colors.white;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "SPP tahun Ajaran " + tagihan[i]['tahun_ajaran'].toString(),
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Futura Medium',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 11.0,
            ),
            GridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              crossAxisCount: 4,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_januari']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_januari',
                                namabulan: 'Januari')),
                      );
                    } else if (int.parse(tagihan[i]['spp_januari']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_januari']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_januari',
                                namabulan: 'spp_Januari')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorJanuari,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Jan',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_februari']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_februari',
                                namabulan: 'Februari')),
                      );
                    } else if (int.parse(tagihan[i]['spp_februari']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_februari']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_februari',
                                namabulan: 'Februari')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorFebruari,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Feb',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_maret']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_maret',
                                namabulan: 'Maret')),
                      );
                    } else if (int.parse(tagihan[i]['spp_maret']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_maret']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_maret',
                                namabulan: 'Maret')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorMaret,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Mar',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_april']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_april',
                                namabulan: 'April')),
                      );
                    } else if (int.parse(tagihan[i]['spp_april']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_april']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_april',
                                namabulan: 'April')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorApril,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Apr',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_mei']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_mei',
                                namabulan: 'Mei')),
                      );
                    } else if (int.parse(tagihan[i]['spp_mei']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_mei']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_mei',
                                namabulan: 'Mei')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorMei,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Mei',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_juni']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_juni',
                                namabulan: 'Juni')),
                      );
                    } else if (int.parse(tagihan[i]['spp_juni']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_juni']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_juni',
                                namabulan: 'Juni')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorJuni,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Jun',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_juli']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_juli',
                                namabulan: 'Juli')),
                      );
                    } else if (int.parse(tagihan[i]['spp_juli']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_juli']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_juli',
                                namabulan: 'Juli')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorJuli,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Jul',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_agustus']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_agustus',
                                namabulan: 'Agustus')),
                      );
                    } else if (int.parse(tagihan[i]['spp_agustus']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_agustus']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_agustus',
                                namabulan: 'Agustus')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorAgustus,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Agu',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_september']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_september',
                                namabulan: 'September')),
                      );
                    } else if (int.parse(tagihan[i]['spp_september']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_september']) <
                        300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_september',
                                namabulan: 'September')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorSeptember,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sep',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_oktober']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_oktober',
                                namabulan: 'Oktober')),
                      );
                    } else if (int.parse(tagihan[i]['spp_oktober']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_oktober']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_oktober',
                                namabulan: 'Oktober')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorOktober,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Okt',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_november']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_november',
                                namabulan: 'November')),
                      );
                    } else if (int.parse(tagihan[i]['spp_november']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_november']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_november',
                                namabulan: 'November')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorNovember,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Nov',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(tagihan[i]['spp_desember']) == 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_desember',
                                namabulan: 'Desember')),
                      );
                    } else if (int.parse(tagihan[i]['spp_desember']) == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    } else if (int.parse(tagihan[i]['spp_desember']) < 300000) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bayar(
                                nisn: nisnData,
                                id_spp: tagihan[i]['id_spp'],
                                bulan: 'spp_desember',
                                namabulan: 'Desember')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Invoice()),
                      );
                    }
                  },
                  child: Card(
                    color: colorDesember,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(.50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Des',
                          textAlign: TextAlign.center,
                          style: tagihanTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17.0,
            ),
          ],
        );
      },
    );
  }
}
