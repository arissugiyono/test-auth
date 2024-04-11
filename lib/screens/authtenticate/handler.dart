import 'package:flutter/material.dart';
import 'package:testapp/screens/authtenticate/login.dart';
import 'package:testapp/screens/authtenticate/register.dart';

class Handler extends StatefulWidget {
  const Handler({super.key});

  @override
  State<Handler> createState() => _HandlerState();
}

class _HandlerState extends State<Handler> {
  bool showSingIn =
      true; //fungsi u/ membaca button yg di klik ke login atau register

  void toogleView() {
    //berfungsi mentansfusikan jika showSignIn false akan masuk register dan sebaliknya
    setState(() {
      showSingIn =
          !showSingIn; // tanda ! untuk membalikkan dari true jadi false dan sembalinya
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSingIn) {
      return Login(
        toogleView: toogleView,
      );
    } else {
      return Register();
    }
  }
}
