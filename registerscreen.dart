import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<StatefulWidget> {
  int genderRadioValue = 0; //ganti '-1' kalau ga mau milih
  String valuePekerjaan;
  List itemPekerjaan = [
    'Designer',
    'Programmer',
    'Software Tester',
    'Business Analyst',
    'SCRUM Master'
  ];

  String valuePendidikan;
  List itemPendidikan = ['SD', 'SMP', 'SLTA', 'D3', 'S1', 'S2', 'S3'];

  String valueHobby;
  List itemHobby = [
    'Makan',
    'Tidur',
    'Nonton',
    'Membaca',
    'Traveling',
    'Menggambar'
  ];
  String tanggalLahir = '-';
  DateTime tanggalTerpilih = DateTime.now();
  bool agreeValue = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromRGBO(217, 175, 205, 1.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registration Form'),
        ),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  maxLength: 50, //batas text
                  decoration: InputDecoration(
                      hintText: 'Nama Lengkap',
                      hintStyle: TextStyle(color: Colors.orangeAccent),
                      counterText: ''), //untuk hide countertex
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  //batas text
                  decoration: InputDecoration(
                    hintText: 'Usia',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                  ), //untuk hide countertext
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  maxLength: 50, //batas text
                  decoration: InputDecoration(
                    hintText: 'Alamat',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                  ), //untuk hide countertext
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  //batas text
                  decoration: InputDecoration(
                    hintText: 'No. HP',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                  ), //untuk hide countertext
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  //maxLength: 50, //batas text
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                  ), //untuk hide countertext
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jenis Kelamin'),
                    Row(
                      children: [
                        new Radio(
                          value: 0,
                          groupValue: genderRadioValue,
                          onChanged: handleRadioClick,
                        ),
                        Text('Laki-Laki'),
                        new Radio(
                          value: 1,
                          groupValue: genderRadioValue,
                          onChanged: handleRadioClick,
                        ),
                        Text('Perempuan')
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jenis Pekerjaan'),
                    Container(
                        width: size.width,
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text('Silahkan Pilih'),
                          value: valuePekerjaan,
                          items: itemPekerjaan.map((pekerjaan) {
                            return DropdownMenuItem(
                              child: Text(pekerjaan),
                              value: pekerjaan,
                            );
                          }).toList(),
                          onChanged: (pekerjaan) {
                            setState(() {
                              valuePekerjaan = pekerjaan;
                            });
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pendidikan Terakhir'),
                    Container(
                        width: size.width,
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text('Silahkan Pilih'),
                          value: valuePendidikan,
                          items: itemPendidikan.map((pekerjaan) {
                            return DropdownMenuItem(
                              child: Text(pekerjaan),
                              value: pekerjaan,
                            );
                          }).toList(),
                          onChanged: (pekerjaan) {
                            setState(() {
                              valuePendidikan = pekerjaan;
                            });
                          },
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hobi'),
                    Container(
                        width: size.width,
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text('Silahkan Pilih'),
                          value: valueHobby,
                          items: itemHobby.map((pekerjaan) {
                            return DropdownMenuItem(
                              child: Text(pekerjaan),
                              value: pekerjaan,
                            );
                          }).toList(),
                          onChanged: (pekerjaan) {
                            setState(() {
                              valueHobby = pekerjaan;
                            });
                          },
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tanggal Lahir"),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.calendar_today_sharp),
                            onPressed: () {
                              pilihTanggalLahir(context);
                            }),
                        Text(
                          '$tanggalLahir',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Text('Dengan melakukan registrasi,'
                      'Anda menyetuiji syarat dan ketentuan')),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: CheckboxListTile(
                  title: Text('Saya setuju'),
                  value: agreeValue,
                  onChanged: (newValue) {
                    setState(() {
                      agreeValue = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: agreeValue ? () => sayaSetuju() : null,
                child: Text('Register'),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  sayaSetuju() {
    //Validasi data di skpi dlu
    Navigator.of(context).pop();
  }

  void pilihTanggalLahir(BuildContext context) async {
    final DateTime picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());

    if (picker != null && picker != tanggalTerpilih) {
      setState(() {
        tanggalTerpilih = picker;

        //konversi dari DateTime menjadi String yg di inginkan
        tanggalLahir = DateFormat('dd-MMM-yyyy').format(tanggalTerpilih);
      });
    }
  }

  void handleRadioClick(int value) {
    setState(() {
      genderRadioValue = value;
    });
    switch (genderRadioValue) {
      case 0:
        Fluttertoast.showToast(
            msg: 'Laki-laki', toastLength: Toast.LENGTH_SHORT);
        break;
      case 1:
        Fluttertoast.showToast(
            msg: 'Perempuan', toastLength: Toast.LENGTH_SHORT);
        break;
    }
  }
}
