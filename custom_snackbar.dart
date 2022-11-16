import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customSnackBar(String message) => SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.amberAccent, fontSize: 16),
      ),
      duration: Duration(seconds: 3),
    );

Widget customSnackBarWithTitle(String title, String message) => SnackBar(
      content: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: title + '\n', style: TextStyle(color: Colors.blueGrey)),
          TextSpan(text: message),
        ]),
      ),
      duration: Duration(seconds: 3),
    );
