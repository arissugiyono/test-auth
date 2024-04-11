import 'package:flutter/material.dart';
import 'package:testapp/models/loginUser.dart';
import 'package:testapp/services/auth.dart';

class Login extends StatefulWidget {
  final Function? toogleView;

  const Login({super.key, this.toogleView});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _showHide = true;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<
      FormState>(); // fungsi inisialisasi data pada form pengiriman data
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      controller: _email,
      autofocus: false,
      validator: (value) {
        if (value!.contains('@') && value!.endsWith('.com')) {
          return null;
        }
        return 'email tidak sesuai';
      },
    );
    final passwordField = TextFormField(
      obscureText: _showHide,
      controller: _password,
      autofocus: false,
      validator: (value) {
        // ignore: unnecessary_null_comparison
        if (value!.isEmpty || value == null) {
          return 'password tidak boleh kosong';
        }
        return null;
      },
    );
    ;
    final txtButton = TextButton(
        onPressed: () {
          widget.toogleView!();
        },
        child: Text('Belum terdaftar'));

    final loginAnonymousButton = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () async {},
        child: Text('Sign in Anonymous'),
      ),
    );
    final loginEmailPasswordButton = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () async {
          if (_globalKey.currentState!.validate()) {
            dynamic result = await _authService.signInEmailPassword(
                LoginUser(email: _email.text, password: _password.text));
            if (result.uid == null) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(result.code),
                    );
                  });
            }
          }
        },
        child: Text('Sign in Email'),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Testting auth'),
      ),
      body: Column(children: [
        Form(
            key: _globalKey,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    emailField,
                    SizedBox(
                      height: 20,
                    ),
                    passwordField,
                    SizedBox(
                      height: 20,
                    ),
                    txtButton,
                    SizedBox(
                      height: 20,
                    ),
                    loginAnonymousButton,
                    SizedBox(
                      height: 20,
                    ),
                    loginEmailPasswordButton,
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ))
      ]),
    );
  }
}
