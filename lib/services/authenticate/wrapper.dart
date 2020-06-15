import 'package:flutter/material.dart';
import 'package:iwacu_version1/Models/user.dart';
import 'package:iwacu_version1/services/auth.dart';
import 'package:iwacu_version1/services/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return Authenticate();
    }else {
    return Scaffold(
          body: Center(
        child: Container(
          child: InkWell(
            onTap: () async{
              await _auth.signOut();
            },
            child: Text("Mwaramutse ${user.email}")),
        ),
      ),
    );
      
    }
  }
}