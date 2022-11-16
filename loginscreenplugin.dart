import 'package:Batch_256/utilities/shared_preferences.dart';
import 'package:Batch_256/viewmodels/login_user_viewmodel.dart';
import 'package:Batch_256/views/dashboardscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreenPlugin extends StatelessWidget {
  BuildContext _context;
  LoginData _loginData;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return FlutterLogin(
      title: 'Batch 256',
      theme: LoginTheme(titleStyle: TextStyle(fontSize: 30)),
      logo: 'assets/images/test1.png',
      // onSignup: _onSignup,
      onLogin: _authUserReqres,
      onSubmitAnimationCompleted: () {
        loginUser(_loginData.name, _loginData.password);
        //login sukses, lakukan aksi selanjutnya
      },
    );
  }

  Duration get loginTime => Duration(milliseconds: 3000);
  static const users = const {
    'nensi@lala.com': '1234',
    'nensizik@lala.com': '12345',
  };

  Future<String> _authUser(LoginData data) {
    print('Name : ${data.name}, Password : ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username Not Exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _authUserReqres(LoginData data) async {
    print('Name : ${data.name}, Password : ${data.password}');
    _loginData = data;
    return null;
    // await LoginUserViewModel().postDataToAPI(context, email, password)
  }

  void loginUser(String email, String password) async {
    await LoginUserViewModel()
        .postDataToAPI(_context, email, password)
        .then((value) {
      if (value != null) {
        //ambil token login
        String token = value.token;
        SharePreferencesHelper.saveToken(token);
        SharePreferencesHelper.saveIsLogin(true);
        SharePreferencesHelper.saveUserName(email);
        SharePreferencesHelper.savePassword(password);
        SharePreferencesHelper.saveIsRemember(false);
//pindah ke screen dashboard
        Navigator.of(_context).pushReplacement(MaterialPageRoute(builder: (_) {
          return DashboardScreen();
        }));
      } else {
        Navigator.of(_context).pushReplacement(MaterialPageRoute(builder: (_) {
          return LoginScreenPlugin();
        }));
      }
    });
  }
}
