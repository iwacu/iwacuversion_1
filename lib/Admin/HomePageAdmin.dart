import 'package:flutter/material.dart';
import 'package:iwacu_version1/constants/constants.dart';
import 'package:iwacu_version1/themes/light_color.dart';


class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.only(top:30,left:18,right:18,bottom:18),
        child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              //icon image
             
              Center(
                child: Text("Admin", style: TextStyle(color: Colors.black
                      ,fontSize:40,
                      fontWeight: FontWeight.bold),
                      ),
              ),
                SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    decoration: textInputDecorationEmail.copyWith(
                      hintText: 'Injiza imeli',
                    ),
                    validator: (val) => val.isEmpty ? 'Injiza imeli yawe' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
              ),
             // SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                    decoration: textInputDecorationPassword.copyWith(
                      hintText: 'Injiza ijambo ry\'ibanga ',
                    ),

                    // style: TextStyle(color: Colors.black),
                    // keyboardType: TextInputType.,
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'ijambo ry\'ibanga rigomba kurenga inyuguti 6'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),
              ),
              //////////////////////
              SizedBox(height: 20.0),
              Container(
                       height:50,
                      decoration:BoxDecoration(
                       color: LightColor.yellowColor,
                        borderRadius: BorderRadius.circular(50)
                        ),
                                child: InkWell(
                                  onTap: () async{
                               if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                   

                  
                  }
                                  },
                                                                  child: Center(
                            child:Text("Sign_In", style:TextStyle(fontWeight: FontWeight.bold))
                          ),
                                ),
                        

                    ),
              SizedBox(height: 20.0),
              
        
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ])),
      ),
    ));
   }
}