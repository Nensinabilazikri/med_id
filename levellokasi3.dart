import 'package:Batch_256/utilities/repositories/shared_preferences_lokasi.dart';
import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/viewmodels/list_levellokasi_viewmodel.dart';
import 'package:Batch_256/views/ft2/level_lokasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LevelLokasi3 extends StatefulWidget {
  @override
  LevelLokasi3State createState() => LevelLokasi3State();
}

class LevelLokasi3State extends State<StatefulWidget> {
  @override
  bool isiNama = false;
  final _nama = TextEditingController();
  final _namaSingkat = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Tambah Level Lokasi'),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list_outlined),
              onPressed: () {
                Navigator.pushNamed(context, (Routes.levelLokasi2));
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 40, top: 35, bottom: 5),
            child: Text(
              'Nama*',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: TextField(
                controller: _nama,
                decoration: InputDecoration(
                  errorText: isiNama ? "Nama harus di isi" : null,
                  border: OutlineInputBorder(),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 40, top: 15, bottom: 5),
            child: Text(
              'Nama Singkat',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: TextField(
              controller: _namaSingkat,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                // hintText: 'Nama atau Nama Singkatan',
                // hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
          ),
          // SizedBox(
          //   height: 300,
          // ),
          Expanded(
            child: SizedBox(),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _nama.text.isEmpty ? isiNama = true : isiNama = false;
                });
                if (isiNama != true) {
                  SharePreferencesHelper.saveNama(_nama.text);
                  ListLevelLokasiViewmodel().tambahNamaLevelLokasiViewmodel(
                      context, _nama.text, _namaSingkat.text);
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return levelLokasi();
                  }));
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 16,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                ),
                child: Text(
                  'Simpan',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
