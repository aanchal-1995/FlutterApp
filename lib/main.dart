// import 'dart:js';

import 'package:awesome_app/Pages/home_page.dart';
import 'package:awesome_app/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'Pages/home_page.dart';
import 'Pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "AWESOME APP",
    home:
        Constants.prefs.getBool("LoggedIn") == true ? HomePage() : LoginPage(),
    theme: ThemeData(primarySwatch: Colors.amber),
    routes: {
      "/login": (context) => LoginPage(),
      "/home": (context) => HomePage()
    },
  ));
}
