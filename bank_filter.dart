import 'package:Batch_256/models/bank_model.dart';
import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/views/ft2_bank/bank_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BankFilter extends StatefulWidget {
  @override
  BankFilterState createState() => BankFilterState();
}

class BankFilterState extends State<StatefulWidget> {
  @override
  List<Result> _listLokasi = List<Result>.empty();
  List _pilihLokasiAsc = [];
  List _pilihLokasiDsc = [];
  List temp = [];
  bool _filter = false;
  bool reset = false;
  bool isNama = false;
  //bool isNamaSing = false;

  TextEditingController _keywordPencarian = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Filter',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list_outlined),
              onPressed: () {
                Navigator.pushNamed(context, (Routes.bankfilter));
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Text(
                      'Cari ',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Material(
                      elevation: 1.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 10, top: 5, bottom: 5),
                          child: TextField(
                            controller: _keywordPencarian,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Cari berdasarkan nama',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18),
                            ),
                            onChanged: (value) {},
                          ))),
                ),
              ],
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
                'Urutkan Berdasarkan ',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: tombolNama(),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: tombolNamaSingkatan(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Text(
                'Urutan ',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: tombolASC(),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: tombolDESC(),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                reset = true;
                SharePreferencesHelper.saveIsFilterBank(false);
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return BankScreen();
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
              setState(() {
                kondisi(isNama);
                kondisiAscDesc(_filter);
                if (_keywordPencarian.text.length >= 1) {
                  SharePreferencesHelper.saveCariBank(_keywordPencarian.text);
                  //SharePreferencesHelper.savefilterNama(isNama);
                  // if (isNama) {
                  //   SharePreferencesHelper.savefilterNama(isNama);
                  // }
                  // if (isNamaSing) {
                  //   SharePreferencesHelper.savefilterNamaSingkat(isNamaSing);
                  // }
                  SharePreferencesHelper.saveIsFilterBank(true);
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return BankScreen();
                  }));
                }
              });

              // Navigator.pushNamed(context, (Routes.levelLokasihasilfilter));
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
                'Terapkan Filter',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tombolASC() {
    return ElevatedButton(
      onPressed: () {
        _filter = true;
        setState(() {});
      },
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      child: Text(
        'A-Z',
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
    );
  }

  Widget tombolDESC() {
    return ElevatedButton(
      onPressed: () {
        _filter = false;
      },
      child: Text('Z-A', style: TextStyle(fontSize: 18)),
    );
  }

  Widget kondisi(isNama) {
    if (isNama) {
      tombolNamaSingkatan();
    } else {
      tombolNama();
    }
    SharePreferencesHelper.savefilterNamaBank(isNama);
  }

  Widget kondisiAscDesc(_filter) {
    if (_filter) {
      tombolASC();
    } else {
      tombolDESC();
    }
    SharePreferencesHelper.savefilterasc(_filter);
  }

  Widget tombolNama() {
    return ElevatedButton(
      onPressed: () {
        //yang muncul nama
        setState(() {
          if (isNama) {
            isNama = false;
          }
        });
      },
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
      child: Text(
        'Nama',
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
    );
  }

  Widget tombolNamaSingkatan() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isNama = true;
          // isNamaSing = false;
        });
        //yg muncul nama singkatan
      },
      child: Text('Nama Singkatan', style: TextStyle(fontSize: 18)),
    );
  }

  void filterLokasi(int index) async {
    _listLokasi.forEach((element) {
      _pilihLokasiAsc.add(element.toString());
    });

    _pilihLokasiAsc.sort();
    _listLokasi = null;
    _listLokasi = _pilihLokasiAsc;
    _listLokasi.forEach((element) {
      print('hasil = $element');
    });
  }

  void filterLokasiDesc() async {
    _listLokasi.forEach((element) {
      _pilihLokasiDsc.add(element.toString());
    });
    for (int i = 1; i <= _pilihLokasiDsc.length; i++) {
      temp.add(_pilihLokasiDsc[_pilihLokasiDsc.length - i]);
    }
    _listLokasi = null;
    _listLokasi = temp;
    _listLokasi.forEach((element) {
      print('hasil desc = $element');
    });
  }
}
