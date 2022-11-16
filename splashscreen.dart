import 'dart:async';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/views/dashboardscreen.dart';
import 'package:Batch_256/views/loginscreen.dart';
import 'package:Batch_256/views/loginscreenplugin.dart';
import 'package:Batch_256/views/loginscreenreqres.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 175, 205, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/test1.png',
              width: 180.0,
              height: 180.0,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, bottom: 20, left: 10)),
            Text(
              'Batch 256 Flutter',
              style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'ChampagneLimousines'),
            ),
            SizedBox(
              height: 10.0,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Versi ',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              TextSpan(
                  text: '1.0 ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontStyle: FontStyle.italic))
            ]))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //inisialisasi

    startSplashScreenDelay();
  }

  startSplashScreenDelay() async {
    var duration = Duration(seconds: 8);
    return Timer(duration, callback);
  }

  void callback() {
    SharePreferencesHelper.readIsLogin().then((isLogin) {
      if (isLogin) {
        pindahDashboardScreen();
      } else {
        // pindahLoginScreen();
        pindahLoginScreenPlugin();
      }
    });
  }

  void pindahLoginScreenPlugin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return DashboardScreen();
    }));
  }

  void pindahLoginScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return LoginScreen();
    }));
  }

  void pindahLoginScreenReqres() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return LoginScreenReqres();
    }));
  }

  void pindahDashboardScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return DashboardScreen();
    }));
  }
}

/*
import 'dart:async';

import 'package:Batch_256/views/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 175, 205, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/test1.png',
              width: 180.0,
              height: 180.0,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, bottom: 20, left: 10)),
            Text(
              'Batch 256 Flutter',
              style: TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'BiomeRegular'),
            ),
            SizedBox(
              height: 10.0,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Versi ',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              TextSpan(
                  text: '1.0 ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontStyle: FontStyle.italic))
            ]))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //inisialisasi

    startSplashScreenDelay();
  }

  startSplashScreenDelay() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, callback);
  }

  void callback() {
    //apakah sudah login?
    pindahLoginScreen();
  }

  void pindahLoginScreen() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return LoginScreen();
    }));
  }
}

 */
