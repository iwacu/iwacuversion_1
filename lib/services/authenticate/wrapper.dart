import 'package:flutter/material.dart';
import 'package:iwacu_version1/Home_Page/MyHomePage.dart';
import 'package:iwacu_version1/Models/user.dart';
import 'package:iwacu_version1/services/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

//this class checks if a user is logged_in ;if yes display Myhomepage ;if no display authenticate page
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //check to see if the user is null in otherwords(check if the user is not logged in)
    if(user == null){
      //if the user is null,retuns Authenticate_Page
      return Authenticate();
    }else {
      //if the user is not null ,returns MyHomepage_Page
    return MyHomePage();
      
    }
  }
}