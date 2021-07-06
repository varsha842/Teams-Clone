//For the signup page

import 'package:flutter/material.dart';
import 'package:clone/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register(this.toggleView);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = ' ';

  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign in'),
                onPressed: () {
                  widget.toggleView();
                })
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: ListView(children: <Widget>[
                SizedBox(height: 100),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign up to Teams',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          backgroundColor: Colors.white38,
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          fontStyle: FontStyle.italic),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter a email' : null,
                    controller: mail,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        )),
                        labelText: 'user@mail.com'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator: (val) => val.length < 6
                        ? 'Password must be atleast 6 character'
                        : null,
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        )),
                        labelText: 'Password'),
                  ),
                ),
                Container(
                    height: 40,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  mail.text, password.text);
                          if (result == null) {
                            setState(() => error = 'Enter valid email');
                          }
                          print(mail.text);
                          print(password.text);
                        }
                      },
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                          onPrimary: Colors.white,
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    )),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ]),
            )));
  }
}
