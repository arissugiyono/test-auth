import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/firebaseUser.dart';
import 'package:testapp/screens/authtenticate/handler.dart';
import 'package:testapp/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return Handler();
    } else {
      return Home();
    }
  }
}
