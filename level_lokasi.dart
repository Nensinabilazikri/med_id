import 'dart:convert';
import 'package:Batch_256/components/costum_confirmation_dialog.dart';
import 'package:Batch_256/models/level_lokasi_model.dart';
import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/viewmodels/list_levellokasi_viewmodel.dart';
import 'package:Batch_256/views/ft2/levellokasi3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class levelLokasi extends StatefulWidget {
  @override
  levelLokasiState createState() => levelLokasiState();
}

class levelLokasiState extends State<StatefulWidget> {
  @override
  var sort;
  bool pilih = false;
  int _indexpilih;
  bool isFilter = false;
  bool isDelete = false;
  bool isFilterNama = false;
  bool isFilterAsc = false;
  var _bgColor = MaterialStateProperty.all(Colors.lightBlue[50]);
  var _bgColorSelected = MaterialStateProperty.all(Colors.grey);

  List<Result> _outputdata = List<Result>.empty();
  List<Result> _outputdatafilter = List<Result>.empty();
  List<String> datanama = [];
  List<String> datanamasingkatan = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print('sebelum $isFilter');
      SharePreferencesHelper.readIsFilter().then((value) {
        if (value) {
          String search;

          print('sesudah $value');
          isFilter = true;
          print(isFilter);
          SharePreferencesHelper.readCariLokasi().then((value) {
            search = value;
            print(search);
            getListFilterLokasi(search, 1, 4, 5);
          });

          SharePreferencesHelper.readIsFilter().then((value) {
            sort = value;
          });

          SharePreferencesHelper.readfilterNama().then((value) {
            isFilterNama = value;
            print('tombolnama :$isFilterNama');
          });
          SharePreferencesHelper.readfilterasc().then((value) {
            isFilterAsc = value;
            print('tombolnamass :$isFilterAsc');
          });
        } else {
          tampilkanDataLevelLokasi();
        }
      });
    });
  }

  Widget build(BuildContext context) {
    print('$datanama  dan  $datanamasingkatan');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Level Lokasi',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list_outlined),
              onPressed: () {
                Navigator.pushNamed(context, (Routes.levelLokasi2));
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: isFilter ? listLevelLokasiFilter() : listLevelLokasiraw()),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 16,
            child: Padding(
              padding: EdgeInsets.fromLTRB(1, 5, 1, 2),
              child: ButtonTheme(
                minWidth: 300,
                height: 40,
                child: tombolDelete(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tombolDelete() {
    return Container(
      alignment: Alignment.topCenter,
      // width: MediaQuery.of(context).size.width,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          width: 400,
          height: 34,
          child: ElevatedButton(
            onPressed: () {
              if (pilih) {
                print("Test1 > ${_outputdata[_indexpilih].name} : $pilih");

                var confirmDialog = CustomConfirmationDialog(
                  title: "Anda akan menghapus data",
                  message: "${_outputdata[_indexpilih].name}",
                  yes: "Hapus",
                  no: "Batal",
                  pressYes: () {
                    deleteLokasi(_outputdata[_indexpilih].id);
                    setState(() {
                      Navigator.of(context).pop();
                      _indexpilih = -1;
                      pilih = false;
                    });
                  },
                  pressNo: () {
                    Navigator.of(context).pop();
                  },
                );
                showDialog(context: context, builder: (_) => confirmDialog);
              } else {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return LevelLokasi3();
                }));
              }
            },
            child: Text(
              pilih ? "Hapus" : "Tambah Lokasi",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )
      ]),
    );
  }

  Widget listLevelLokasiFilter() {
    isFilter = false;
    return ListView.builder(
        itemCount: _outputdatafilter.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: Card(
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        _indexpilih == index ? _bgColorSelected : _bgColor,
                    elevation: MaterialStateProperty.all(1)),
                onPressed: () {
                  datanama.add(_outputdata[index].name);
                  setState(() {});
                },
                child: Text(
                    isFilterNama
                        ? '${_outputdatafilter[index].abbreviation}'
                        : '${_outputdatafilter[index].name}',
                    style: TextStyle(
                        fontSize: 20,
                        color:
                            _indexpilih == index ? Colors.blue : Colors.grey)),
              ),
            ),
          );
        });
  }

  Widget listLevelLokasiraw() {
    return ListView.builder(
        itemCount: _outputdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: Card(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      _indexpilih == index ? _bgColorSelected : _bgColor,
                ),
                onLongPress: () {
                  setState(() {
                    if (pilih) {
                      pilih = false;
                    } else {
                      pilih = true;
                    }
                    _indexpilih = index;
                  });
                },
                child: Text('${_outputdata[index].name}',
                    style: TextStyle(
                        fontSize: 20,
                        color:
                            _indexpilih == index ? Colors.blue : Colors.grey)),
              ),
            ),
          );
        });
  }

  Future<LevellokasiModel> deleteLokasi(String id) async {
    print("id yg mau di delete $id");

    final http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:2555/api/location_level/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print("Respon> $response.statusCode");

    if (response.statusCode == 200) {
      print(response.body);

      String result = jsonEncode(response.body);
      print("Result $result");

      setState(() {
        tampilkanDataLevelLokasi();
      });
    } else {
      throw Exception('Failed to delete.');
    }
  }

  tampilkanDataLevelLokasi() async {
    await ListLevelLokasiViewmodel().getDataFromAPI(context).then((value) {
      setState(() {
        //print('jumlah record data : ${svalue.result}');
        _outputdata = value.result;
      });
    });
  }

  void getListFilterLokasi(
      String search, int order, int page, int pagesize) async {
    print('dari void get $search');
    ListLevelLokasiViewmodel()
        .getFilterLevelLokasi(context, search, order, page, pagesize)
        .then((value) {
      setState(() {
        _outputdatafilter = value.result;
        if (isFilterAsc) {
          _outputdatafilter.sort((a, b) => a.name.compareTo(b.name));
        } else {
          _outputdatafilter.sort((b, a) => a.name.compareTo(b.name));
        }
      });
    });
  }
}
