import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spp_pay/UI/Dashboard/Admin/Invoice.dart';

class Bayar extends StatefulWidget {
  final String nisn;
  final String id_spp;
  final String bulan;
  final String namabulan;

  Bayar({Key key, this.nisn, this.id_spp, this.bulan, this.namabulan})
      : super(key: key);
  @override
  _BayarState createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  TextEditingController nominal = new TextEditingController();
  void initState() {
    super.initState();
    ambiltagihan();
    ambildatasiswa();
    idPetugas();
  }

  String tahunajaran = "";
  String totaltagihan = "";
  String namasiswa = "";
  String kelassiswa = "";
  String jurusansiswa = "";
  String idpetugas = "";

  void ambiltagihan() async {
    Uri uritagihan = Uri.parse("http://192.168.42.42/spp_app/get_tagihan.php");
    final responseTagihan = await http.post(uritagihan, body: {
      "id_spp": widget.id_spp,
    });

    dynamic hasilTagihan = json.decode(responseTagihan.body);
    if (hasilTagihan != null) {
      setState(() {
        tahunajaran = hasilTagihan[0]['thn'];
        totaltagihan = hasilTagihan[0][widget.bulan];
      });
    } else {
      setState(() {
        tahunajaran = null;
      });
    }
    return hasilTagihan;
  }

  void ambildatasiswa() async {
    Uri uriDetail = Uri.parse("http://192.168.42.42/spp_app/bayar.php");
    final responseDetail = await http.post(uriDetail, body: {
      "nisn": widget.nisn,
    });

    var dataSiswa = json.decode(responseDetail.body);
    setState(() {
      namasiswa = dataSiswa[0]['nama_siswa'];
      kelassiswa = dataSiswa[0]['nama_kls'];
      jurusansiswa = dataSiswa[0]['komp_keahlian'];
    });
  }

  alertFormValidation(BuildContext context) {
    // set up the buttons
    Widget continueButton = FlatButton(
      child: Text("Oke", style: TextStyle(fontFamily: 'Montserrat Medium')),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Oopss",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Futura Bold', fontSize: 22)),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset("assets/images/isi.png", height: 150),
            SizedBox(
              height: 25,
            ),
            Text("Masukkan nominal pembayaran yahh",
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontFamily: 'Montserrat Medium', fontSize: 18)),
          ]),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  alertFailed(BuildContext context) {
    // set up the buttons
    Widget continueButton = FlatButton(
      child: Text("Oke", style: TextStyle(fontFamily: 'Montserrat Medium')),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Oopss",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Futura Bold', fontSize: 22)),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset("assets/images/failed.png", height: 150),
            SizedBox(
              height: 25,
            ),
            Text("Hmm terjadi kesalahan,\n coba lagi",
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontFamily: 'Montserrat Medium', fontSize: 18)),
          ]),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void bayarspp() async {
    if (nominal.text == "") {
      setState(() {
        alertFormValidation(context);
      });
    } else if (nominal.text != "") {
      Uri pembayaran =
          Uri.parse("http://192.168.42.42/spp_app/pembayaran_spp.php");
      final responsePembayaran = await http.post(pembayaran, body: {
        "tagihan": '$totaltagihan',
        "nominal": nominal.text,
        "bulan": widget.bulan,
        "id_spp": widget.id_spp,
        "nisn": widget.nisn,
        "id_petugas": '$idpetugas',
      });

      var dataPembayaran = json.decode(responsePembayaran.body);
      if (dataPembayaran == "gagal") {
        setState(() {
          alertFailed(context);
        });
      } else if (dataPembayaran == "berhasil") {
        setState(() {
          alertSucces(context);
        });
      } else {
        setState(() {
          alertFailed(context);
        });
      }
    } else {
      setState(() {
        alertFormValidation(context);
      });
    }
  }

  void idPetugas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      idpetugas = prefs.getString('id');
    });
  }

  alertSucces(BuildContext context) {
    // set up the buttons
    Widget continueButton = FlatButton(
      child: Text("Oke", style: TextStyle(fontFamily: 'Montserrat Medium')),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Invoice()),
        );
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Berhasil",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Futura Bold', fontSize: 22)),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset("assets/images/register.png", height: 150),
            SizedBox(
              height: 25,
            ),
            Text("Terimakasih telah melakukan transaksi",
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontFamily: 'Montserrat Medium', fontSize: 18)),
          ]),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: ListView(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back))),
                // SizedBox(width:50),
                Center(
                  widthFactor: 2,
                  child: Image.asset('assets/images/logo_home.png', scale: 5),
                ),
                Padding(padding: const EdgeInsets.only(right: 50)),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
