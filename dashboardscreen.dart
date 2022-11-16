import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/views/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dasboard Menu'),
        backgroundColor: Color.fromRGBO(180, 111, 165, 1.0),
      ),
      // drawer: NavigationDrawer(),
      body: DashboardScreenLayout(),
    );
  }
}

class DashboardScreenLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardScreenLayoutState();
}

class DashboardScreenLayoutState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, //buat ngebagi kotak dalam 1 screen
      children: [
        // Card(
        //     color: Colors.amberAccent,
        //     child: InkWell(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(
        //             CupertinoIcons.ant_fill,
        //             color: Colors.white,
        //             size: 80.0,
        //           ),
        //           Text(
        //             'Parsing Data',
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           ),
        //         ],
        //       ),
        //       onTap: () {
        //         Navigator.pushNamed(context, (Routes.parsingdatascreen));
        //       },
        //     )),
        // Card(
        //     color: Colors.deepOrangeAccent,
        //     child: InkWell(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(
        //             CupertinoIcons.photo,
        //             color: Colors.white,
        //             size: 80.0,
        //           ),
        //           Text(
        //             'Imaging & Slider',
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //         ],
        //       ),
        //       onTap: () {
        //         Navigator.pushNamed(context, (Routes.imagesliderscreen));
        //       },
        //     )),
        // Card(
        //     color: Colors.deepPurpleAccent,
        //     child: InkWell(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(
        //             CupertinoIcons.camera_fill,
        //             color: Colors.white,
        //             size: 80.0,
        //           ),
        //           Text(
        //             'Camera & Galery',
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //         ],
        //       ),
        //       onTap: () {
        //         Navigator.pushNamed(context, (Routes.cameragalleryscreen));
        //       },
        //     )),
        // Card(
        //     color: Colors.greenAccent,
        //     child: InkWell(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(
        //             CupertinoIcons.doc_on_doc_fill,
        //             color: Colors.white,
        //             size: 80.0,
        //           ),
        //           Text(
        //             'Databases',
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //         ],
        //       ),
        //       onTap: () {
        //         Navigator.pushNamed(context, (Routes.levelLokasi));
        //       },
        //     )),
        // Card(
        //     color: Colors.brown,
        //     child: InkWell(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(
        //             CupertinoIcons.location,
        //             color: Colors.white,
        //             size: 80.0,
        //           ),
        //           Text(
        //             'Location Servces',
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //         ],
        //       ),
        //       onTap: () {
        //         Navigator.pushNamed(context, (Routes.locationservicesscreen));
        //       },
        //     )),
        // Card(
        //     color: Colors.lightGreen,
        //     child: InkWell(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(
        //             CupertinoIcons.map_pin_ellipse,
        //             color: Colors.white,
        //             size: 80.0,
        //           ),
        //           Text(
        //             'Map Services',
        //             style: TextStyle(fontSize: 18, color: Colors.white),
        //           )
        //         ],
        //       ),
        //       onTap: () {
        //         Navigator.pushNamed(context, (Routes.mapservicesscreen));
        //       },
        //     )),
        Card(
            color: Colors.redAccent,
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.compass,
                    color: Colors.white,
                    size: 80.0,
                  ),
                  Text(
                    'Bank',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, (Routes.newscreen));
              },
            )),
        Card(
            color: Colors.redAccent,
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.doc_chart_fill,
                    color: Colors.white,
                    size: 80.0,
                  ),
                  Text(
                    'Level Lokasi',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, (Routes.levelLokasi));
              },
            )),
        Card(
            color: Colors.redAccent,
            child: InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.search_circle,
                    color: Colors.white,
                    size: 80.0,
                  ),
                  Text(
                    'Cari Dokter',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, (Routes.caridokterscreen));
              },
            )),
      ],
    );
  }
}

//Row(
//             children: [
//               SizedBox(
//                 height: 300,
//               ),
//               Text('Username : $username,\nPassword : $password'),
//               TextButton(
//                   onPressed: () {
//                     //1. flag islogin jadikan false
//                     SharePreferencesHelper.saveIsLogin(false);
//                     //2. buang screen dashboard, tampilkan login
//                     Navigator.of(context)
//                         .pushReplacement(MaterialPageRoute(builder: (_) {
//                       return LoginScreen();
//                     }));
//                   },
//                   child: Text('keluar'))
//             ],
//           ),
// void initState() {
//   super.initState();
//
//   SharePreferencesHelper.readUsername().then((value) {
//     setState(() {
//       username = value;
//     });
//   });
//   SharePreferencesHelper.readPassword().then((value) {
//     setState(() {
//       password = value;
//     });
//   });
//   //SharePreferencesHelper.clearALLData();
// }
