//Decide where to navigate(sign in or sign up page)

import 'package:clone/Home.dart';
import 'package:clone/screen/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clone/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
