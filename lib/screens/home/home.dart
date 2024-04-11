import 'package:flutter/material.dart';
import 'package:testapp/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    final signOut = Material(
      child: MaterialButton(
        onPressed: () async {
          await authService.signOut();
        },
        child: Text('logout'),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
          child: signOut,
        ));
  }
}
