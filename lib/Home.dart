//Page to be showen after user signIn

import 'dart:convert';

import 'package:clone/screen/MeetScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:clone/pojo/meeting_details.dart';
import 'package:clone/services/auth.dart';
import 'package:clone/services/meet_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  TextEditingController join = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void goToMeetingScreen(MeetingDetail meetingDetail) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MeetingScreen(
          meetingId: meetingDetail.id,
          name: FirebaseAuth.instance.currentUser.displayName,
          meetingDetail: meetingDetail,
        ),
      ),
    );
  }

  void validateMeeting(String meetingId) async {
    try {
      Response response = await joinMeeting(meetingId);
      var data = json.decode(response.body);
      final meetingDetail = MeetingDetail.fromJson(data);
      print('meetingDetail $meetingDetail');
      goToMeetingScreen(meetingDetail);
    } catch (err) {
      final snackbar = SnackBar(content: Text('Invalid Meeting Id'));
      var scaffoldKey;
      scaffoldKey.currentState.showSnackBar(snackbar);
      print(err);
    }
  }

  void joinMeet() async {
    final meetingId = join.text;
    print('Joined meeting $meetingId');
    validateMeeting(meetingId);
  }

  void startMeetingClick() async {
    var response = await startMeeting();
    print(response.body);
    final body = json.decode(response.body);
    final meetingId = body['meetingId'];
    print('Started meeting $meetingId');
    validateMeeting(meetingId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Teams Clone'),
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            ElevatedButton(
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    onPrimary: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1)))),
                onPressed: () async {
                  await _auth.signOut();
                })
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 25),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Welcome to Teams Clone',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            backgroundColor: Colors.white38,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            fontStyle: FontStyle.italic),
                      )),
                  SizedBox(height: 25),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      // validator: (val) =>
                      //     val.isEmpty ? 'Enter valid meeting ID' : null,
                      controller: join,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.keyboard),
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        )),
                        labelText: 'meeting ID',
                      ),
                      // onChanged: (val) {
                      //   setState(() => mail = val as TextEditingController);
                      // },
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    child: Text('Join Meeting'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        onPrimary: Colors.white,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: joinMeet,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text(
                      'Create Meeting',
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        onPrimary: Colors.white,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: startMeetingClick,
                  ),
                ],
              )),
        ));
  }
}
