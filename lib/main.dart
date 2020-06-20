import 'package:flutter/material.dart';
import 'package:iwacu_version1/Models/user.dart';
import 'package:iwacu_version1/services/auth.dart';
import 'package:iwacu_version1/services/authenticate/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
            theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}