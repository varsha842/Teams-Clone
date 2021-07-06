// import 'package:flutter/material.dart';
// import 'package:clone/pojo/meeting_details.dart';
// import 'package:clone/screen/MeetScreen.dart';

// class JoinScreen extends StatefulWidget {
//   final String meetingId;
//   MeetingDetail meetingDetail;

//   JoinScreen({Key key, this.meetingId, this.meetingDetail}) : super(key: key);

//   @override
//   _JoinScreenState createState() => _JoinScreenState();
// }

// class _JoinScreenState extends State<JoinScreen> {
//   final TextEditingController textEditingController =
//       new TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   void join() {
//     var name = textEditingController.text;
//     Navigator.pushReplacement(context,
//         MaterialPageRoute(builder: (BuildContext context) {
//       return MeetingScreen(
//         meetingId: widget.meetingId,
//         name: name,
//         meetingDetail: widget.meetingDetail,
//       );
//     }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Join Meeting',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               padding: EdgeInsets.all(20.0),
//               child: TextFormField(
//                 controller: textEditingController,
//                 decoration: InputDecoration(
//                   border: new OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                     const Radius.circular(30.0),
//                   )),
//                   hintText: 'Enter your name',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               child: Text('Join Meeting'),
//               style: ElevatedButton.styleFrom(
//                   primary: Colors.blueGrey,
//                   onPrimary: Colors.white,
//                   elevation: 5,
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)))),
//               onPressed: join,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
