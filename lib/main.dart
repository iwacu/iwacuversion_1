import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iwacu_version1/Models/user.dart';
import 'package:iwacu_version1/services/auth.dart';
import 'package:iwacu_version1/services/authenticate/wrapper.dart';
import 'package:iwacu_version1/themes/theme.dart';
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
            theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
             debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}