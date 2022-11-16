import 'dart:convert';

import 'package:Batch_256/models/bank_model.dart';
import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/viewmodels/bank_viewmodel.dart';
import 'package:Batch_256/viewmodels/list_levellokasi_viewmodel.dart';
import 'package:Batch_256/views/ft2_bank/bank_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BankTambah extends StatefulWidget {
  @override
  BankTambahState createState() => BankTambahState();
}

class BankTambahState extends State<StatefulWidget> {
  @override
  bool isiNama = false;
  bool isiVa = false;
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
                Navigator.pushNamed(context, (Routes.bankfilter));
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
              'Kode VA*',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: TextField(
              controller: _namaSingkat,
              decoration: InputDecoration(
                errorText: isiNama ? "Kode VA harus di isi" : null,
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
                  _namaSingkat.text.isEmpty ? isiVa = true : isiVa = false;
                });
                if (isiNama != true || isiVa != true) {
                  SharePreferencesHelper.saveNama(_nama.text);
                  BankViewModel().tambahNamaBankViewmodel(
                      context, _nama.text, _namaSingkat.text);
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return BankScreen();
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

  Future<BankModel> VaCode(String va_code) async {
    final http.Response response = await http.get(
      Uri.parse('http://10.0.2.2:2555/api/bank/$va_code'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var data = jsonDecode(response.body);
    var rest = data["result"] as List;
    if (rest.isNotEmpty) {
      var va = rest[0]["va_code"];
      if (_namaSingkat == va) {
        print('VA code sudah ada  $va');
      }
    }
  }
}
