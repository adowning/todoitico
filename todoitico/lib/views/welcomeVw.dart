import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoitico/views/listTodosVw.dart';
import 'package:todoitico/views/loginVw.dart';

class WelcomeVw extends StatelessWidget {
  static const String route = 'WelcomeVw';

  Future<void> redirect(BuildContext context) async {
    return Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context,
          FirebaseAuth.instance.currentUser != null ? ListTodosVw.route : LoginVw.route,
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    redirect(context);
    return Scaffold(body: Container(alignment: Alignment.center, child: Text(':)', style: TextStyle(fontSize: 50))));
  }
}
