import 'package:awesome_app/Pages/home_page.dart';
import 'package:awesome_app/widgets/bg_image.dart';
import 'package:awesome_app/utils/Constants.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            BGImage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Card(
                    child: Column(
                      children: [
                        Form(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Username :",
                                      labelText: "Username"),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter Password :",
                                    labelText: "Password",
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        RaisedButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));

                              Constants.prefs.setBool("LoggedIn", true);
                              Navigator.pushReplacementNamed(context, "/home");

                              // Navigator.pushNamed(context, "/home");
                            },
                            child: Text("Sign In"),
                            color: Colors.amberAccent),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
