import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iwacu_version1/constants/constants.dart';

class EditProducts extends StatefulWidget {
  EditProducts({this.email, this.index, this.productBrand, this.productDetails, this.productName, this.productPhone, this.productPrice, this.productQuality});
  final String email;
  final String productName ;
  final String productPrice ;
  final String productDetails ;
  final String productPhone ;
  final String productBrand ;
  final String productQuality ;
  final index;
  
   
  @override
  _EditProductsState createState() => _EditProductsState();
}

class _EditProductsState extends State<EditProducts> {
  TextEditingController controllerTitle;
  TextEditingController controllernote;
  TextEditingController controllerprice;
  TextEditingController controllerphone;
   TextEditingController controllerbrand;
    TextEditingController controllerquality;
 
 
  

  
  String productName ;
  String productPrice ;
  String productDetails ;
  String productPhone ;
  String productBrand ;
  String productQuality ;
   
   void _updateData(){
   Firestore.instance.runTransaction((Transaction transaction) async{
     DocumentSnapshot snapshot =
     await transaction.get(widget.index);
     await transaction.update(snapshot.reference,{
       "productName" : productName,
       "productPrice": productPrice,
       "productDetails" : productDetails,
       "productPhone" : productPhone,
       "productBrand" : productBrand,
       "productQuality" : productQuality,

     });


   });
   Fluttertoast.showToast(msg: 'Update Successfully');
  }
   
       //Adding EditProducts details to the database
       


  @override
  void initState() {
    
    super.initState();
    productName =widget.productName;
    productPrice = widget.productPrice;
    productDetails = widget.productDetails;
    productPhone = widget.productPhone;
    productBrand = widget.productBrand;
    productQuality = widget.productQuality;
     controllerTitle = new TextEditingController(
       text: widget.productName);
       controllernote = new TextEditingController(
       text: widget.productDetails);
        controllerprice = new TextEditingController(
       text: widget.productPrice);
        controllerphone = new TextEditingController(
       text: widget.productPhone);
        controllerquality = new TextEditingController(
       text: widget.productQuality);
        controllerbrand = new TextEditingController(
       text: widget.productBrand);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: null,
              title: Text("Edit Products Here", style: TextStyle(color: Colors.black, fontSize: 20),),
              brightness: Brightness.light,
            
              iconTheme: new IconThemeData(color: Colors.black),
              ),

              body: new ListView(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                        TextField(
                          controller: controllerTitle,
                          onChanged: (String str){
                           setState(() {
                            productName=str;
                           });

                        },
                        decoration: textDecoration('Product Name'),//textInputDecorationUpdateProduct.copyWith(hintText: " Product_Name"),
                        ),
                        SizedBox(height:12.0),
                        TextField(
                          controller: controllerprice,
                          onChanged: (String str){
                           setState(() {
                            productPrice=str;
                           });

                        },
                        decoration: textDecoration('Product Price'),//textInputDecorationUpdateProduct.copyWith(hintText: " Product_Price"),
                        ),
                        SizedBox(height:12.0),
                        TextField(
                          controller: controllernote,
                          onChanged: (String str){
                           setState(() {
                            productDetails=str;
                           });

                        },
                        decoration: textDecoration('Product Details'),//textInputDecorationUpdateProduct.copyWith(hintText: " Product Details"),
                        ),
                        SizedBox(height:12.0),
                        TextField(
                          controller: controllerbrand,
                          onChanged: (String str){
                           setState(() {
                            productBrand=str;
                           });

                        },
                        decoration: textDecoration('Product Brand'),//textInputDecorationUpdateProduct.copyWith(hintText: " Product Brand  "),
                        ),
                        SizedBox(height:12.0),
                        TextField(
                          controller: controllerquality,
                          onChanged: (String str){
                           setState(() {
                            productQuality=str;
                           });

                        },
                        decoration: textDecoration('Product Quality'),//textInputDecorationUpdateProduct.copyWith(hintText: " Product Quality "),
                        ),
                        SizedBox(height:12.0),
                        TextField(
                          controller: controllerphone,
                          onChanged: (String str){
                           setState(() {
                            productPhone=str;
                           });

                        },
                        decoration: textDecoration('Phone Number'),//textInputDecorationUpdateProduct.copyWith(hintText: "Phone number for Odering  "),
                        ),
                        SizedBox(height:12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                          RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),

                      ),
                      
                      onPressed: (){
                        _updateData();
                      }),
                      RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),

                      ),
                      
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                        ],)
                      ],),
                    ),
                  )
                ],),

      );
  }
}