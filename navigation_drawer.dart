import 'file:///C:/Users/XSIS%20Bootcamp/AndroidStudioProjects/flutter_app/lib/components/custom_alert_dialog.dart';
import 'package:Batch_256/utilities/routes.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'file:///C:/Users/XSIS%20Bootcamp/AndroidStudioProjects/flutter_app/lib/components/costum_confirmation_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Batch_256/components/custom_expansion_tile.dart' as custom;

import 'loginscreen.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  NavigationDrawerState createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<StatefulWidget> {
  @override
  bool pilih = true;
  String username = '';
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [createHeaderMenu(context), createContentMenu(context)],
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.7,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: Colors.black12,
              ),
              child: TextButton(
                child: Text('Logout'),
                onPressed: () {
                  var confirmationdialog = CustomConfirmationDialog(
                    title: 'Confirmation',
                    message: 'Apakah anda yakin ingin Logout',
                    yes: 'Ya',
                    no: 'Tidak',
                    pressYes: () {
                      //jadi logout
                      SharePreferencesHelper.saveIsLogin(false);
                      //ganti dashboard jd login screen
                      // Navigator.of(context).pop();
                      // Navigator.pushReplacementNamed(
                      //     context, Routes.loginscreen);

                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(
                          context, Routes.loginscreenplugin);
                    },
                    pressNo: () {
                      Navigator.of(context).pop();
                    },
                  );
                  showDialog(
                      context: context, builder: (_) => confirmationdialog);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createHeaderMenu(BuildContext context) {
    return Container(
      //color: Colors.blueGrey,
      height: MediaQuery.of(context).size.height * 0.3,
      child: DrawerHeader(
        decoration: BoxDecoration(color: Color.fromRGBO(217, 175, 205, 1.0)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.5gHrxrD00yFbZkFJpHVQMgHaHa?pid=ImgDet&w=400&h=400&rs=1',
                    height: 100,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    '$username',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Versi 1.0',
              style: TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget createContentMenu(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
          color: Colors.white70,
          child: ListTile(
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.home,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.dashboardscreen);
            },
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
          //color: Colors.amberAccent ,
          child: custom.ExpansionTile(
            headerBackgroundColor: Colors.white70,
            iconColor: Colors.white70,
            leading: Icon(
              CupertinoIcons.gear_solid,
              color: Colors.blueGrey,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-10, 0, 0),
              child: Text(
                'Administrator',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ),
            children: [
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.play,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Daftar Pengguna',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.play,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Edit Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.play,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Laporan pengguna',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
          //color: Colors.amberAccent ,
          child: custom.ExpansionTile(
            headerBackgroundColor: Colors.white70,
            iconColor: Colors.white70,
            leading: Icon(
              CupertinoIcons.gear_solid,
              color: Colors.blueGrey,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-10, 0, 0),
              child: Text(
                'Setting',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ),
            children: [
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.play,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Daftar Pengguna',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.play,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Edit Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.play,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Laporan pengguna',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
  // void showAlertLogout(BuildContext context){
  //   Widget continueButton=TextButton(child: Text('OK'),onPressed:(){
  //   SharePreferencesHelper.saveIsLogin(false);
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) }
  //
  //   );););}
  //   return LoginScreen();
  //   }

  void showAlert(BuildContext context, String _title, String _message) {
    var alertDialog = CustomAlertDioalog(
      title: _title,
      message: _message,
      action_text: 'OK',
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void initState() {
    super.initState();
    SharePreferencesHelper.readUsername().then((value) {
      setState(() {
        username = value;
      });
    });
  }
}
