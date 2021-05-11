import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   foregroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      //   backgroundColor: Colors.transparent,
      // ),
      body: ListView(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,size: 28,color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Text('Halaman', style: TextStyle(fontSize: 20,color: Colors.white)),
                Text(
                  'Tagihan',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Data Pembayar',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8)),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 370.0,
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
                          'NIS',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Text('NIS', style: TextStyle(fontSize: 20)),
                        Text(
                          'Nama Lengkap',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Text('Nama Lengkap', style: TextStyle(fontSize: 20)),
                        Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Text('Jenis Kelamin', style: TextStyle(fontSize: 20)),
                        Text(
                          'Kelas',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Text('Kelas', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Pilih Tagihan Pembayar',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8)),
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
                  width: double.infinity,
                  height: 370.0,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SPP Tahun Ajaran',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height:20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
