import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iwacu_version1/constants/constants.dart';
import 'package:iwacu_version1/services/auth.dart';
import 'package:iwacu_version1/themes/light_color.dart';

class Registration extends StatefulWidget {
  //function for toggling view
  final Function toggleView;
  Registration({this.toggleView});
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final AuthService _auth = AuthService();
  //variables declaration

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String displayname = '';
  String fullName = '';
  String phoneNumber = '';
  String location = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.lightGrey,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 28, right: 28, bottom: 18),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Text(
                          "Muraho\n Neza",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40.0),
                        TextFormField(
                            decoration: textInputDecorationFullName.copyWith(
                                hintText: 'Injiza Amazina akuranga'),
                            validator: (val) => val.isEmpty
                                ? 'Injiza Amazina yawe yuzuye hano '
                                : null,
                            onChanged: (val) {
                              setState(() => fullName = val);
                            }),
                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration: textInputDecorationEmail.copyWith(
                                hintText: 'Injiza imeli'),
                            validator: (val) =>
                                val.isEmpty ? 'Injiza imeli yawe ' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration: textInputDecorationPassword.copyWith(
                                hintText: 'Injiza ijambo ry\'ibanga '),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'ijambo ry\'ibanga rigomba kurenga inyuguti 6'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration: textInputDecorationPhonenumber.copyWith(
                                hintText:
                                    'Injiza Nomero ya telefoni igendanwa'),
                            validator: (val) => val.isEmpty
                                ? 'Injiza Nomero ya telefoni igendanwa'
                                : null,
                            onChanged: (val) {
                              setState(() => phoneNumber = val);
                            }),
                        SizedBox(height: 20.0),
                        TextFormField(
                            decoration: textInputDecorationAddress.copyWith(
                                hintText: 'Injiza aderesi yawe'),
                            validator: (val) =>
                                val.isEmpty ? 'Injiza aderesi yawe' : null,
                            onChanged: (val) {
                              setState(() => location = val);
                            }),
                        SizedBox(height: 20.0),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: LightColor.yellowColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: InkWell(
                            onTap: () async {
                              var arr = fullName.split(' ');
                              setState(() {
                                displayname = arr[0];
                              });
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email,
                                        password,
                                        fullName,
                                        displayname,
                                        phoneNumber,
                                        location);
                                       Fluttertoast.showToast(msg: 'Murakoze Kwiyandikisha');
                                if (result == null) {
                                  setState(() {
                                    error = 'Mwongere musubiremo';
                                    
                                  });
                                }
                              }
                            },
                            child: Center(
                                child: Text("Kwiyandikisha",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Niba mwifuza kwinjira\n mukanda kwinjira'),
                            InkWell(
                              splashColor: LightColor.grey,
                              onTap: () async {
                                widget.toggleView();
                              },
                              child: Text(
                                'Kwinjira',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ]),
                ),
              ))),
    );
  }
}
