import 'dart:async';
import 'dart:ui';

import 'package:clone/screen/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Wrapper(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.jpeg',
            height: MediaQuery.of(context).size.height / 2,
          ),
          SizedBox(
            height: 5.0,
          ),
          SpinKitFadingFour(color: Colors.white),
        ],
      ),
    );
  }
}
