import 'package:firebase_auth/firebase_auth.dart';
import 'package:clone/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //creat user obj based on Firebaseuser
  Users _userFromFirebase(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  //sign with email and password
  Future signInWithEmailAndPassword(String mail, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: mail, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //register with email and password

  Future registerWithEmailAndPassword(
      String name, String mail, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: mail, password: password);

      User user = result.user;
      user.updateDisplayName(name);

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
