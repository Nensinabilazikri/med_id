import 'dart:convert';

import 'package:Batch_256/components/costum_confirmation_dialog.dart';
import 'package:Batch_256/models/bank_model.dart';
import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/viewmodels/bank_viewmodel.dart';
import 'package:Batch_256/views/ft2_bank/bank_tambah.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BankScreen extends StatefulWidget {
  @override
  BankScreenState createState() => BankScreenState();
}

class BankScreenState extends State<StatefulWidget> {
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print('sebelum $isFilter');
      SharePreferencesHelper.readIsFilterBank().then((value) {
        if (value) {
          String search;
          String sort;
          SharePreferencesHelper.readfilterNamaBank().then((value) {
            isFilterNama = value;
            print('tombolnama :$isFilterNama');
          });
          print('sesudah $value');
          isFilter = true;
          print(isFilter);
          SharePreferencesHelper.readCariBank().then((value) {
            search = value;
            if (isFilterNama) {
              sort = "name";
            } else {
              sort = "va_code";
            }
            print(search);
            print(sort);
            getListFilterBank(search, 1, 1, 5, sort);
          });

          SharePreferencesHelper.readfilterasc().then((value) {
            isFilterAsc = value;
            print('tombolnamass :$isFilterAsc');
          });
        } else {
          tampilkanDataBank();
        }
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BANK',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list_outlined),
              onPressed: () {
                Navigator.pushNamed(context, (Routes.bankfilter));
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: listBankraw()),
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
    return ElevatedButton(
      onPressed: () {
        if (pilih) {
          print("Test1 > ${_outputdata[_indexpilih].name} : $pilih");

          var confirmDialog = CustomConfirmationDialog(
            title: "Anda akan menghapus data",
            message: "${_outputdata[_indexpilih].name}",
            yes: "Hapus",
            no: "Batal",
            pressYes: () {
              deleteBank(_outputdata[_indexpilih].id);
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
            return BankTambah();
          }));
        }
      },
      child: Text(
        pilih ? "Hapus" : "Tambah Lokasi",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  // Widget listBankFilter() {
  //   isFilter = false;
  //   return ListView.builder(
  //       itemCount: _outputdatafilter.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Padding(
  //           padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
  //           child: Card(
  //             child: TextButton(
  //               style: ButtonStyle(
  //                   backgroundColor:
  //                       _indexpilih == index ? _bgColorSelected : _bgColor,
  //                   elevation: MaterialStateProperty.all(1)),
  //               onPressed: () {
  //                 setState(() {});
  //               },
  //               child: Text(
  //                   isFilterNama
  //                       ? '${_outputdatafilter[index].vaCode}'
  //                       : '${_outputdatafilter[index].name}',
  //                   style: TextStyle(
  //                       fontSize: 20,
  //                       color:
  //                           _indexpilih == index ? Colors.blue : Colors.grey)),
  //             ),
  //           ),
  //         );
  //       });
  // }

  Widget listBankraw() {
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

  Future<BankModel> deleteBank(String id) async {
    print("id yg mau di delete $id");

    final http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:2555/api/bank/$id'),
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
        tampilkanDataBank();
      });
    } else {
      throw Exception('Failed to delete.');
    }
  }

  tampilkanDataBank() async {
    await BankViewModel().getDataBANKFromAPI(context).then((value) {
      setState(() {
        //print('jumlah record data : ${svalue.result}');
        _outputdata = value.result;
      });
    });
  }

  void getListFilterBank(
      String search, int page, int order, int pagesize, String sort) async {
    print('dari void get $search');
    BankViewModel()
        .getFilterBank(context, search, page, order, pagesize, sort)
        .then((value) {
      setState(() {
        _outputdatafilter = value.result;
      });
    });
  }
}
