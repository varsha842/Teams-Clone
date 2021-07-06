//for the sign in page

import 'package:flutter/material.dart';
import 'package:clone/services/auth.dart';

import 'package:flutter_svg/svg.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = ' ';

  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  @override
  // String mail = ' ';
  // String password = ' ';
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Teams Clone',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 100),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Sign In to Teams',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            backgroundColor: Colors.white38,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            fontStyle: FontStyle.italic),
                      )),
                  // SizedBox(height: size * 0.03),
                  // SvgPicture.asset(
                  //   "assets/icons/login.svg",
                  //   height: size * 0.35,
                  // ),
                  // Container(
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.all(10),
                  //     child: Text('Sign in',
                  //         style: TextStyle(
                  //             fontSize: 20,
                  //             fontStyle: FontStyle.italic,
                  //             fontWeight: FontWeight.w200))),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      controller: mail,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        )),
                        labelText: 'user@mail.com',
                      ),
                      // onChanged: (val) {
                      //   setState(() => mail = val as TextEditingController);
                      // },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ char long'
                          : null,
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0),
                          )),
                          labelText: 'Password'),
                      // onChanged: (val) {
                      //   setState(
                      //       () => password = val as TextEditingController);
                      // }
                    ),
                  ),
                  // FlatButton(
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => Sign()));
                  //   },
                  //   textColor: Colors.blue,
                  //   child: Text('Forgot Password'),
                  // ),
                  SizedBox(height: 10.0),
                  Container(
                      height: 40,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey,
                              onPrimary: Colors.white,
                              elevation: 5,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic result =
                                  await _auth.signInWithEmailAndPassword(
                                      mail.text, password.text);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not sign in with those credentials';
                                });
                              }
                            }
                          })),
                  SizedBox(height: 5.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontSize: 15),
                        ),
                        FlatButton(
                          textColor: Colors.blueGrey,
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            widget.toggleView();
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  )
                ],
              )),
        ));
  }
}
