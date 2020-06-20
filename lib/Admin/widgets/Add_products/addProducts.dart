import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iwacu_version1/constants/constants.dart';
import 'package:iwacu_version1/themes/light_color.dart';

class AdminAddProducts extends StatefulWidget {
  @override
  _AdminAddProductsState createState() => _AdminAddProductsState();
}

class _AdminAddProductsState extends State<AdminAddProducts> {
  File _image1;
  File _image2;
  File _image3;
  String productName = '';
  String productPrice1 = '';
  String productPrice2 = '';
  String productPrice3 = '';
  String productDetails = '';
  String productPhone = '';
  String productBrand = '';
  String productQuality = '';
  int viewsIncrement = 0;
  String _dropDownValue;
  List _products = [];
  Map<String, List> _product1 = {};
  Map<String, List> _product2 = {};
  Map<String, List> _product3 = {};
  String _subProduct1;
  String _subProduct2;
  String _subProduct3;
  String _subProduct4;
  String _subProduct5;
  String _subProduct6;
  bool isLoading = false;
  String error='';
  List _productCategory = ['Cotton', 'Polyster'];
  Map<String, bool> values = {
    'Red': false,
    'Black': false,
    'green': false,
    'Yellow': false,
    'Pink': false,
    'Chocolate': false,
    'grey': false,
  };
  List sub1 = [];
  List sub2 = [];
  List sub3 = [];
  Map<int, List> kelly = {
    2000: [0, 1]
  };

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var tmpArray = [];

  //adding data to firebase
  void _addData() async {
    setState(() {
      isLoading = true;
    });
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    //_product1[productPrice1]=sub1;
    sub1.add(_subProduct5);
    sub1.add(_subProduct6);
    _product1[productPrice1] = sub1;
    //_product2[productPrice2]=sub2;
    sub2.add(_subProduct3);
    sub2.add(_subProduct4);
    _product2[productPrice2] = sub2;
    sub3.add(_subProduct1);
    sub3.add(_subProduct2);
    _product3[productPrice3] = sub3;

    _products.add(_product1);
    _products.add(_product2);
    _products.add(_product3);
    
    Firestore.instance.runTransaction((Transaction transaction) async {
      if (_formKey.currentState.validate()) {
        //  checking if images are null
        if (_image1 != null && _image2 != null && _image3 != null) {
          String imageUrl1;
          String imageUrl2;
          String imageUrl3;
          //  saving images to firestore
          final StorageReference storage =
              FirebaseStorage.instance.ref().child("Users post Images");

          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
           StorageUploadTask task1 = storage.child(picture1).putFile(_image1);
          final String picture2 =
              "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task2 = storage.child(picture2).putFile(_image2);
          final String picture3 =
              "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task3 = storage.child(picture3).putFile(_image3);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);
          StorageTaskSnapshot snapshot2 =
              await task2.onComplete.then((snapshot) => snapshot);
          //   getting images url
          await task3.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();
            List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];
            // getting postId
            final DocumentReference documentReference =
                await Firestore.instance.collection('Post').add({
              'Postid': "",
            });
            final String jobIdd = documentReference.documentID;
            //  setting Post(products) to firebase
            await Firestore.instance
                .collection('Post')
                .document(jobIdd)
                .setData({
              'priceRanges': _products,
              'productCategory':_dropDownValue,
              'views': 0,
              'likes': [],
              'productName': productName,
              'Colors':tmpArray,
              'images':imageList,
              'postId':jobIdd,
              'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch
            }).catchError((e){
              setState(() {
                error=e;
              });
            });
              Fluttertoast.showToast(msg: 'product added');
            setState((){isLoading = false;});
          });
        } else {
          Fluttertoast.showToast(msg: 'all the images must be provided');
        }
      } else {
        setState((){isLoading = false;});
      }
    });

    Fluttertoast.showToast(msg: '$error');
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print(error);
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //insert Picture
                        SizedBox(height: 12.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            "Insert 3 pictures inside each Box",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTile(
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlineButton(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 2.5),
                                      onPressed: () {
                                        _selectImage(
                                            ImagePicker.pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality: 50),
                                            1);
                                      },
                                      child: _displayChild1()),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlineButton(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 2.5),
                                      onPressed: () {
                                        _selectImage(
                                            ImagePicker.pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality: 50),
                                            2);
                                      },
                                      child: _displayChild2()),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlineButton(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 2.5),
                                    onPressed: () {
                                      _selectImage(
                                          ImagePicker.pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 50),
                                          3);
                                    },
                                    child: _displayChild3(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.0),
                        //insert Product Name
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            "Insert Product Name",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: TextFormField(
                            decoration: textDecoration('Product Name'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter productname ' : null,
                            onChanged: (val) {
                              setState(() {
                                productName = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 12.0),
                        //Product category
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: DropdownButton(
                            hint: _dropDownValue == null
                                ? Text('Product Category')
                                : Text(
                                    _dropDownValue,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.blue),
                            items: _productCategory.map(
                              (vale) {
                                return DropdownMenuItem<String>(
                                  value: vale,
                                  child: Text(vale),
                                );
                              },
                            ).toList(),
                            onChanged: (vale) {
                              setState(
                                () {
                                  _dropDownValue = vale;
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 12.0),
                        //insert product price range 1
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            "Insert Product price range 1",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: LightColor.darkgrey)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextFormField(
                                    decoration: textDecoration('Product Price'),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter product_Price '
                                        : null,
                                    onChanged: (val) {
                                      setState(() {
                                        productPrice1 = val;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'From'),
                                        onChanged: (val) {
                                          setState(() {
                                            _subProduct5 = val;
                                          });
                                        },
                                      ),
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'to'),
                                        onChanged: (val) {
                                          setState(() {
                                            _subProduct6 = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        //insert product price range 2
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            "Insert Product price range 2",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: LightColor.darkgrey)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextFormField(
                                    decoration:
                                        textDecoration('Product Price 2'),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter product_Price 2'
                                        : null,
                                    onChanged: (val) {
                                      setState(() {
                                        productPrice2 = val;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'From'),
                                        onChanged: (val) {
                                          setState(() {
                                            _subProduct3 = val;
                                          });
                                        },
                                      ),
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'to'),
                                        onChanged: (val) {
                                          setState(() {
                                            _subProduct4 = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        //insert product price range 3
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            "Insert Product price range 3",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                border: Border.all(color: LightColor.darkgrey)),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextFormField(
                                    decoration:
                                        textDecoration('Product Price 3'),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter product_Price 3'
                                        : null,
                                    onChanged: (val) {
                                      setState(() {
                                        productPrice3 = val;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'From'),
                                        onChanged: (val) {
                                          setState(() {
                                            _subProduct1 = val;
                                          });
                                        },
                                      ),
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: 'to'),
                                        onChanged: (val) {
                                          setState(() {
                                            _subProduct2 = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        //Product Colors
                        ListView(
                          shrinkWrap: true,
                          children: values.keys.map((String key) {
                            return new CheckboxListTile(
                              title: new Text(key),
                              value: values[key],
                              activeColor: Colors.pink,
                              checkColor: Colors.white,
                              onChanged: (bool value) {
                                setState(() {
                                  values[key] = value;
                                });
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 12.0),

                        //Button for submitting form or cancel
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RaisedButton(
                                color: LightColor.yellowColor,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  _addData();
                                }),
                            RaisedButton(
                                color: LightColor.yellowColor,
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        print(tempImg.lengthSync().toString());
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }
  }
}
/*
Firestore.instance.runTransaction((Transaction transaction) async {
      if (_formKey.currentState.validate()) {
        //  checking if images are null
        if (_image1 != null && _image2 != null && _image3 != null) {
          String imageUrl1;
          String imageUrl2;
          String imageUrl3;
          //  saving images to firestore
          final StorageReference storage =
              FirebaseStorage.instance.ref().child("Users post Images");

          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 = storage.child(picture1).putFile(_image1);
          final String picture2 =
              "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task2 = storage.child(picture2).putFile(_image2);
          final String picture3 =
              "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task3 = storage.child(picture3).putFile(_image3);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);
          StorageTaskSnapshot snapshot2 =
              await task2.onComplete.then((snapshot) => snapshot);
          //   getting images url
          task3.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();
            List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];
            // getting postId
            final DocumentReference documentReference =
                await Firestore.instance.collection('Post').add({
              'Postid': "",
            });
            final String jobIdd = documentReference.documentID;
            //  setting Post(products) to firebase
            await Firestore.instance
                .collection('Post')
                .document(jobIdd)
                .setData({
              'priceRanges': _products,
              'productCategory':_dropDownValue,
              'views': 0,
              'likes': [],
              'productName': productName,
              'Colors':colors,
              'images':imageList,
              'postId':jobIdd,
              'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch
            }).catchError((e)=> print(e));
              Fluttertoast.showToast(msg: 'product added');
            setState((){isLoading = false;});
          });
        } else {
          Fluttertoast.showToast(msg: 'all the images must be provided');
        }
      } else {
        setState((){isLoading = false;});
      }
    });
    
 */
