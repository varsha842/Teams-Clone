import 'package:clone/screen/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clone/screen/wrapper.dart';
import 'package:clone/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:clone/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
        value: AuthService().user,
        initialData: null,
        catchError: (_, __) => null,
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Welcome(),
          },
        ));
  }
}
