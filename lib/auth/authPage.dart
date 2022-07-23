import 'package:firebasefirst/pages/logingPage.dart';
import 'package:firebasefirst/pages/registerPage.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initial show the logging page
  bool showLogingPage = true;

  void toggleScreens() {
    setState(() {
      showLogingPage = !showLogingPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogingPage) {
      return LogingPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLogingPage: toggleScreens);
    }
  }
}
