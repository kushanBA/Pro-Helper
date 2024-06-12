import 'package:flutter/material.dart';
import 'package:pro/screens/authentication/login.dart';
import 'package:pro/screens/authentication/register.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authentication> {
  bool signInPage = true;

  //toggle pages
  void swithPages() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signInPage == true) {
      return LogIn(
        toggle: swithPages,
      );
    } else {
      return Register(
        toggle: swithPages,
      );
    }
  }
}
