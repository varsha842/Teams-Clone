//Shows how to toggle between  both the screen

import 'package:clone/screen/SignIn.dart';
import 'package:clone/screen/authenticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn ? SignIn(toggleView) : Register(toggleView),
    );
  }
}
