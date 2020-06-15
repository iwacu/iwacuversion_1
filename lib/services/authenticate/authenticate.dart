import 'package:flutter/material.dart';
import 'package:iwacu_version1/register_signIn/register.dart';
import 'package:iwacu_version1/register_signIn/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Registration(toggleView: toggleView);
    }
  }
}
