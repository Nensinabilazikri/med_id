import 'file:///C:/Users/XSIS%20Bootcamp/AndroidStudioProjects/flutter_app/lib/components/custom_alert_dialog.dart';
import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/views/dashboardscreen.dart';
import 'package:Batch_256/views/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;
  String username = '';
  String password = '';

  final TextEditingController _controllerUsername = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //mengetahui ukuran layar
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Scaffold(
        //mencegah height berubah saat keyboard muncul
        resizeToAvoidBottomInset: false,

        body: GestureDetector(
          onTap: () {
            //ini untuk menghilangkan keyboard
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://backgroundcheckall.com/wp-content/uploads/2017/12/melting-background-1.jpg'),
                  fit: BoxFit.cover),
            ),
            width: size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.0,
                  ),
                  Text(
                    'Login Form',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 55,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'ChampagneLimousines'),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 55),
                      child: TextField(
                        controller: _controllerUsername,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.grey)),
                        onChanged: (value) {
                          username = value;
                          //set value
                        },
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: TextField(
                        controller: _controllerPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white70,
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey)),
                        onChanged: (value) {
                          password = value;
                          //set value
                        },
                        obscureText: true,
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 4, 0, 18),
                    child: CheckboxListTile(
                      title: Text(
                        'Remember Me',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      value: isRememberMe,
                      onChanged: (newValue) {
                        setState(() {
                          isRememberMe = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  ElevatedButton(
                      child: Text("Login"),
                      style: ButtonStyle(
                          // shadowColor: Shadow(color: const Color(Colors.deepOrangeAccent),offset: Offset.zero, blurRadius: 5.0 ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black12),
                          overlayColor: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> state) {
                            if (state.contains(MaterialState.focused))
                              return Colors.lightBlue;
                            if (state.contains(MaterialState.hovered))
                              return Colors.blueAccent;
                            if (state.contains(MaterialState.focused))
                              return Colors.purpleAccent[50];
                            return null;
                          })),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        validateLogin(context);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    onTap: () {
                      pindahKeRegisterScreen(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    SharePreferencesHelper.readIsRemember().then((isremember) {
      if (isremember) {
        SharePreferencesHelper.readUsername().then((value) {
          setState(() {
            username = value;

            _controllerUsername.text = value;
          });
        });
        SharePreferencesHelper.readPassword().then((value) {
          setState(() {
            password = value;

            _controllerPassword.text = value;
          });
        });
      }
    });
  }

  void pindahKeRegisterScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return RegisterScreen();
    }));
  }

  void validateLogin(BuildContext _context) {
    if (username.isEmpty) {
      //belum input
      showAlert(_context, 'Warning!', 'Username Kosong');
    } else if (password.isEmpty) {
      showAlert(_context, 'Warning!', 'Password Kosong');
    } else {
      //sudah input semua
      //simpan login is true
      SharePreferencesHelper.saveIsLogin(true);
      SharePreferencesHelper.saveUserName(username);
      SharePreferencesHelper.savePassword(password);
      SharePreferencesHelper.saveIsRemember(isRememberMe);
      //pindah ke screen dashboard
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return DashboardScreen();
      }));
    }
  }

  void showAlert(BuildContext _context, String _title, String _message) {
    var alertDialog = CustomAlertDioalog(
      title: _title,
      message: _message,
      action_text: 'OK',
    );
    showDialog(context: _context, builder: (_) => alertDialog);
  }
}
