// import 'dart:js';

import 'package:awesome_app/Pages/home_page.dart';
import 'package:flutter/material.dart';
// import 'Pages/home_page.dart';
import 'Pages/login_page.dart';

void main() {
  runApp(MaterialApp(
    title: "AWESOME APP",
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.amber),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => HomePage()
    },
  ));
}
