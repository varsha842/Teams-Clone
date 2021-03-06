import 'dart:async';
import 'dart:ui';

import 'package:clone/screen/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:delayed_widget/delayed_widget.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Wrapper(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DelayedWidget(
              delayDuration: Duration(milliseconds: 800),
              animationDuration: Duration(seconds: 2),
              animation: DelayedAnimations.SLIDE_FROM_RIGHT,
              child: Text(
                'Welcome to Teams Clone',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            DelayedWidget(
              delayDuration: Duration(milliseconds: 800),
              animationDuration: Duration(seconds: 2),
              animation: DelayedAnimations.SLIDE_FROM_RIGHT,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200.0),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/logo.jpeg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            DelayedWidget(
              delayDuration: Duration(milliseconds: 800),
              animationDuration: Duration(seconds: 2),
              animation: DelayedAnimations.SLIDE_FROM_RIGHT,
              child: SpinKitWave(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
