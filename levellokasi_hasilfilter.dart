import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HasilFilterLokasi extends StatefulWidget {
  @override
  HasilFilterLokasiState createState() => HasilFilterLokasiState();
}

class HasilFilterLokasiState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Filter'),
      ),
    );
  }
}
