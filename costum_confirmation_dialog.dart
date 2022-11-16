import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String title, message, yes, no;
  final Function pressYes, pressNo;
  final Color color = Colors.white;

  const CustomConfirmationDialog(
      {this.title,
      this.message,
      this.yes,
      this.no,
      this.pressYes,
      this.pressNo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue)),
      title: Center(
        child: Column(children: [
          Text(title),
          SizedBox(
            height: 70,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          SizedBox(
            height: 100,
          ),
          new TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blueAccent)))),
              onPressed: pressNo,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0),
                child: new Text(
                  no,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              )),
          SizedBox(
            height: 5,
          ),
          new TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              onPressed: pressYes,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.0),
                child: new Text(
                  yes,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )),
        ]),
      ),
    );
  }
}
