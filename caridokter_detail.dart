import 'dart:convert';

import 'package:Batch_256/models/biodatadoc_Model.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class HasilCariDokter extends StatefulWidget {
  @override
  HasilCariDokterState createState() => HasilCariDokterState();
}

class HasilCariDokterState extends State<StatefulWidget> {
  @override
  String id_dokter;
  String namadok;
  String foto =
      'https://firebasestorage.googleapis.com/v0/b/medxsis255.appspot.com/o/images%2Fdoctor-thumb-05.jpg?alt=media&token=742b6b4e-1c71-406c-9dfc-031fecad6a45';
  String spes;
  List datadokter = [];
  int pengalaman = 0;
  String fotolink;
  String fotolagi;
  int tahun;

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      SharePreferencesHelper.readIddokter().then((value) {
        setState(() {
          if (value.isEmpty) {
            print('id dokter detail NULL');
          } else {
            id_dokter = value;
            print('id dokter detail: $id_dokter');
            cariDokter2(id_dokter);
            SharePreferencesHelper.readspesialisasidokter().then((value) {
              spes = value;
            });
            SharePreferencesHelper.readnamadokter().then((value) {
              namadok = value;
            });
            SharePreferencesHelper.readlinkdokter().then((value) {
              fotolink = value;
              print('link foto : $fotolink');
            });
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cari Dokter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: datadokter.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                width: 400,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(5, 30, 5, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 10, 20, 0),
                                  child: fotolink != null
                                      ? CircleAvatar(
                                          radius: 40,
                                          backgroundImage:
                                              NetworkImage(fotolink),
                                        )
                                      : CircularProgressIndicator(),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$namadok',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue),
                                  ),
                                  Text(
                                    '$spes',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.lightBlue),
                                  ),
                                  Text(
                                    '$pengalaman Tahun Pengalaman',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.lightBlue),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            ),
                            Text('Konsultasi Rp. 30.000',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.lightBlueAccent))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }

  Future<BiodokterModel> cariDokter2(String id) async {
    final http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:2555/api/Doctor_biodata'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"id_doctor": id}),
    );

    if (response.statusCode == 200) {
      String result = jsonEncode(response.body);
      print("Result : ${result}");
      print("Status Code : ${response.statusCode}");
    } else {
      throw Exception('Item Not Added!');
    }
    setState(() {
      BiodokterModel model = biodokterModelFromJson(response.body);
      model.result.map((e) {
        pengalaman = e.tyear - e.lyear;
      }).toList();
    });

    // var data = jsonDecode(response.body);
    // var rest = data["result"] as List;
    // print('hasil namaDok: $rest');
    // setState(() {
    //   datadokter = rest;
    //   print('data detail: $datadokter');
    // });
    // int thAwal = datadokter[0].lyear;
    // int thAkhir = datadokter[0].tyear;
    // fotolagi = datadokter[0].image.toString();
    // print('$fotolagi');
    // int pengalaman = thAkhir - thAwal;
    // tahun = pengalaman;
  }
}
