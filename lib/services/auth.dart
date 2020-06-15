

import 'package:firebase_auth/firebase_auth.dart';
import 'package:iwacu_version1/Models/user.dart';
import 'package:iwacu_version1/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//create user obj based on firebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid, email: user.email, displayName: user.displayName)
        : null;
  }

  //Notify auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  //sign with email & password method
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // registration with email and password method
  Future registerWithEmailAndPassword(
      String email, String password,String fullName,String userName,String phoneNumber,String location) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // save userinformations to UsersCollection
      await DatabaseService(uid: user.uid)
          .updateUserData(user.email,fullName,userName,phoneNumber,location);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
    
  }

  //sign out method
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
