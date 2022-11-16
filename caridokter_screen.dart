import 'dart:convert';

import 'package:Batch_256/components/custom_snackbar.dart';
import 'package:Batch_256/models/biodatadoc_Model.dart';
import 'package:Batch_256/models/caridokter2.dart';
import 'package:Batch_256/models/caridokter_model.dart';
import 'package:Batch_256/models/spesialisasi2.dart';
import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/models/lokasi_model.dart';
import 'package:Batch_256/models/spesialisasi_model.dart';
import 'package:Batch_256/models/tindakanmedis_model.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/views/ft2_caridokter/caridokter_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CariDokter extends StatefulWidget {
  @override
  CariDokterState createState() => CariDokterState();
}

class CariDokterState extends State<StatefulWidget> {
  List lokasi = [];
  String lokasii;
  List rolelist = [];
  List<ResultSp> listspeslis = List<ResultSp>.empty();
  List listspes = [];
  List listtindak = [];
  String pilihlokasi;
  String pilihspes;
  String pilihtindak;
  int pengalaman = 0;
  var id_dokter;
  var fullname;
  var spesial;
  var link;

  TextEditingController _keywordPencarian = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    getLokasi();
    getSpesialisasi();
    getLokasi();
    getTindakanmedis();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cari Dokter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Masukkan minimal 1 kata kunci untuk pencarian dokter anda',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Text(
                ' Lokasi',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Container(
              height: 35,
              width: 326,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
              )),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: LokasiPilih(),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
              ),
              Text(
                'Nama Dokter',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Container(
              height: 35,
              width: 326,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
              )),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: CariNama(),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
              ),
              Text(
                'Spesialisasi/Sub-spesialisasi*',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Container(
              height: 35,
              width: 326,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
              )),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: SpesialisasiPilih(),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(25),
              ),
              Text(
                'Tindakan Medis',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Container(
              height: 35,
              width: 326,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue),
              )),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: TindakanPilih(),
              )),
          Expanded(
            child: SizedBox(),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                SharePreferencesHelper.savenamadokter(null);
                SharePreferencesHelper.savelokasidokter(null);
                SharePreferencesHelper.savespesialisasidokter(null);
                SharePreferencesHelper.savetinakdokter(null);
                SharePreferencesHelper.savelinkdokter(null);
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return CariDokter();
                }));
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 16,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
              ),
              child: Text(
                'Atur Ulang',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print('$pilihspes');
              setState(() {
                if (pilihspes != null) {
                  SharePreferencesHelper.savelinkdokter(link);
                  cariDokter1(pilihlokasi, pilihspes, _keywordPencarian.text,
                      pilihtindak);
                  Navigator.pushNamed(context, (Routes.caridokterdetail));
                  // Navigator.of(context)
                  //     .pushReplacement(MaterialPageRoute(builder: (_) {
                  //   return HasilCariDokter();
                  // }));
                } else {
                  customSnackBar('Masukkan minimal 1 kata kunci pencarian');
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return CariDokter();
                  }));
                }
              });
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
                'Cari Dokter',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget LokasiPilih() {
    return DropdownButtonHideUnderline(
        child: ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        iconSize: 30,
        icon: (null),
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        hint: Text('-- Pilih --'),
        onChanged: (String newValue) {
          setState(() {
            pilihlokasi = newValue;
            print('Kata: $pilihlokasi');
            // SharePreferencesHelper.savelokasidokter(pilihlokasi);
          });
        },
        value: pilihlokasi,
        items: rolelist.map((item) {
          return new DropdownMenuItem(
            child: new Text(
              item['name'],
              style: TextStyle(fontSize: 18),
            ),
            value: item['name'].toString(),
          );
        }).toList(),
      ),
    ));
  }

  Widget SpesialisasiPilih() {
    return DropdownButtonHideUnderline(
        child: ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        iconSize: 30,
        icon: (null),
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        hint: Text('-- Pilih --'),
        onChanged: (String newValue) {
          setState(() {
            //ambil kata kunci pilih lokasi
            pilihspes = newValue;
            print('Kata Spesialisasi: $pilihspes');
          });
        },
        value: pilihspes,
        items: listspes.map((item) {
          return new DropdownMenuItem(
            child: new Text(
              item.toString(),
              style: TextStyle(fontSize: 18),
            ),
            value: item.toString(),
          );
        }).toList(),
      ),
    ));
  }

  Widget TindakanPilih() {
    return DropdownButtonHideUnderline(
        child: ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<String>(
        iconSize: 30,
        icon: (null),
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        hint: Text('-- Pilih --'),
        onChanged: (String newValue) {
          setState(() {
            //
            //ambil kata kunci pilih lokasi
            pilihtindak = newValue;
            print('TinMed: $pilihtindak');
            SharePreferencesHelper.savetinakdokter(pilihtindak);
          });
        },
        value: pilihtindak,
        items: listtindak.map((item) {
          return new DropdownMenuItem(
            child: new Text(
              item['name'],
              style: TextStyle(fontSize: 18),
            ),
            value: item['name'].toString(),
          );
        }).toList(),
      ),
    ));
  }

  Widget CariNama() {
    return TextField(
      controller: _keywordPencarian,
      decoration: InputDecoration(
        border: InputBorder.none,
        // hintText: 'Cari berdasarkan nama',
        // hintStyle: TextStyle(
        //     color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 18),
      ),
      onChanged: (value) {},
    );
  }

  Future<LokasiModel> getLokasi() async {
    var res = await http.get(
      Uri.parse("http://10.0.2.2:2555/api/location"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ); //if you have any auth key place here...properly..
    var data = jsonDecode(res.body);
    var rest = data["result"];
    print("data rest = $rest");

    setState(() {
      rolelist = rest;
    });
  }

  Future<SpesialisasiModel> getSpesialisasi() async {
    var res = await http.get(
      Uri.parse("http://10.0.2.2:2555/api/spesialis"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ); //if you have any auth key place here...properly..
    SpesialisasiModel data = spesialisasiModelFromJson(res.body);
    //var rest = data["result"];
    //print("data rest = $rest");

    setState(() {
      listspeslis = data.result;
      for (int i = 0; i < listspeslis.length; i++) {
        if (listspeslis[i].name != null) {
          listspes.add(listspeslis[i].name);
        }
      }
    });
    return data;
  }

  Future<TindakanmedisModel> getTindakanmedis() async {
    var res = await http.get(
      Uri.parse("http://10.0.2.2:2555/api/doctorTreatment"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ); //if you have any auth key place here...properly..
    var data = jsonDecode(res.body);
    var rest = data["result"];
    print("data rest = $rest");

    setState(() {
      listtindak = rest;
    });
  }

  Future<HasilcaridokterModel> cariDokter1(
      String location, String spes, String nameDoc, String tinMed) async {
    final http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:2555/api/doctorFilter'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "location": pilihlokasi,
        "spes": pilihspes,
        "naamDoc": _keywordPencarian.text,
        "tinMed": pilihtindak
      }),
    );

    if (response.statusCode == 200) {
      String result = jsonEncode(response.body);
      //print("Result : ${result}");
      print("Status Code : ${response.statusCode}");
      HasilcaridokterModel model = hasilcaridokterModelFromJson(response.body);
      model.result.map((e) {
        id_dokter = e.idDoctor.first.toString();
        fullname = e.id.toString();
        spesial = e.spesialis.first.toString();
        link = e.image.first.toString();
      }).toList();
      SharePreferencesHelper.saveIddokter(id_dokter);
      SharePreferencesHelper.savespesialisasidokter(spesial);
      SharePreferencesHelper.savenamadokter(fullname);
      print('id dokter: $id_dokter, fullname: $fullname, link: $link');
    } else {
      throw Exception('Item Not Added!');
    }
    // var data = jsonDecode(response.body);
    // var rest = data["result"] as List;
    //print('hasil filter screen: $rest');
    // if (rest.isNotEmpty) {
    //   id_dokter = rest[0]['id_doctor'].toString();
    //   fullname = rest[0]['_id'].toString();
    //   spesial = rest[0]['spesialis'].toString();
    //   link = rest[0]['image'][0].toString();

    // } else {
    //   print('hasil kasong');
    // }
  }
}
