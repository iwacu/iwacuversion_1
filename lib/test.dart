// import 'package:bwiza_version_1/BottomNavigation/bottomNavigation.dart';
// import 'package:bwiza_version_1/HomeWidget/HomePage.dart';
// //import 'package:bwiza_version_1/Products/Home_product.dart';
// import 'package:bwiza_version_1/Products/categorySelectorProduct.dart';
// import 'package:bwiza_version_1/Products/userCart.dart';
// import 'package:bwiza_version_1/models/Post.dart';
// import 'package:bwiza_version_1/models/UsersInforamtions.dart';
// import 'package:bwiza_version_1/models/user.dart';
// import 'package:bwiza_version_1/profile/userProfile.dart';
// import 'package:bwiza_version_1/shared/constants.dart';
// import 'package:bwiza_version_1/sharedSetting/title_text.dart';
// import 'package:bwiza_version_1/sharedSettings/SizeConfig.dart';
// import 'package:bwiza_version_1/themes/light_color.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';

// class ClothesAndShoesDetailsPage extends StatefulWidget {
//   final PostDetail tasks;
//   ClothesAndShoesDetailsPage({this.tasks});
//   @override
//   _ClothesAndShoesDetailsPageState createState() =>
//       _ClothesAndShoesDetailsPageState();
// }

// class _ClothesAndShoesDetailsPageState
//     extends State<ClothesAndShoesDetailsPage> {
//   PersistentBottomSheetController _controller;
//   GlobalKey<ScaffoldState> _key = GlobalKey();
//   bool _open = false;
//   bool isPostLiked;
//   bool isLiked = false;
//   bool isLoading = false;
//   bool isLoadingLikes = false;
//   bool isFavorite;
//   bool activeColor = true;

//   HomePage speedDialHome = HomePage();
//   int _qty = 0;
//   void _add() {
//     setState(() {
//       _qty += 1;
//     });
//   }

//   void _remove() {
//     setState(() {
//       if (_qty > 1) _qty -= 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context);
//     final _userInformations = Provider.of<UsersInformations>(context);
//     isPostLiked = widget.tasks.likes[user.uid] == true;
//     // isLiked = widget.tasks.likesProducts.contains(user.uid) == true;
//     isFavorite =
//         _userInformations.favorites.contains(widget.tasks.jobid) == true;
//     //favorite checking
//     favoriteChecking() async {
//       isFavorite =
//           _userInformations.favorites.contains(widget.tasks.jobid) == true;
//       final Firestore _firestore = Firestore.instance;
//       if (isFavorite) {
//         await _firestore.collection("Users").document(user.uid).updateData({
//           'favorites': FieldValue.arrayRemove([widget.tasks.jobid])
//         });
//         setState(() {
//           isFavorite = false;
//           isLoading = false;
//           Fluttertoast.showToast(msg: 'Product Removed to Favorite List');
//         });
//       } else if (!isFavorite) {
//         //add product documentId to favorites field
//         await _firestore.collection("Users").document(user.uid).updateData({
//           'favorites': FieldValue.arrayUnion([widget.tasks.jobid])
//         });
//         setState(() {
//           isFavorite = true;
//           isLoading = false;
//           Fluttertoast.showToast(msg: 'Product Added to Favorite List');
//         });
//       }
//     }

//     //check if User Liked or Not
//     likeschecking() async {
//       isPostLiked = widget.tasks.likes[user.uid] == true;
//       if (isPostLiked) {
//         final Firestore _firestore = Firestore.instance;
//         await _firestore
//             .collection("Post")
//             .document(widget.tasks.jobid)
//             .updateData({'likes.${user.uid}': false});
//         await _firestore
//             .collection("Post")
//             .document(widget.tasks.jobid)
//             .updateData({"likesIncrement": FieldValue.increment(-1)});

//         setState(() {
//           isPostLiked = false;
//           widget.tasks.likes[user.uid] = false;
//           isLoadingLikes = false;
//         });
//       } else if (!isPostLiked) {
//         //   ref.updateData({'likes.${user.uid}': true});
//         final Firestore _firestore = Firestore.instance;
//         _firestore
//             .collection("Post")
//             .document(widget.tasks.jobid)
//             .updateData({'likes.${user.uid}': true});
//         //add likes
//         await _firestore
//             .collection("Post")
//             .document(widget.tasks.jobid)
//             .updateData({"likesIncrement": FieldValue.increment(1)});

//         //add product documentId to favorites field
//         await _firestore.collection("Users").document(user.uid).updateData({
//           'favorites': FieldValue.arrayUnion([widget.tasks.jobid])
//         });

//         setState(() {
//           isPostLiked = true;
//           widget.tasks.likes[user.uid] = true;
//           isLoadingLikes = false;
//           Fluttertoast.showToast(msg: 'Thank you for liking');
//         });
//       }
//     }
//     //checking views

//     return Scaffold(
//         key: _key,
//         floatingActionButton: FloatingButton(),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 3),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Color(0XffFAF0DA)),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: isLoading
//                       ? CircularProgressIndicator()
//                       : IconButton(
//                           icon: Icon(Icons.message, color: Colors.black),
//                           iconSize: 6 * SizeConfig.imageSizeMultiplier,
//                           onPressed: () {
//                             //   checking();
//                           }),
//                 ),
//               ),
//               SizedBox(
//                 width: 3 * SizeConfig.widthMultiplier,
//               ),
//               Expanded(
//                 child: InkWell(
//                   onTap: () {
//                   if(_userInformations.listOfCarts.contains(widget.tasks.jobid)){
//                      Fluttertoast.showToast(msg: 'product requested; check your cart list');
//                   } else if(user.uid == widget.tasks.userUid ){
//                     Fluttertoast.showToast(msg: 'You can\'t buy your own product');
//                   }
//                   else if(!_userInformations.listOfCarts.contains(widget.tasks.jobid)){
//                     showAlertDialog(context, _submitToCartList);
//                   }
//                   //
//                   },
//                   child: _userInformations.listOfCarts.contains(widget.tasks.jobid) ?
//                    Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Color(0XffFAF0DA)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Icon(
//                             Icons.timer,
//                             color: Colors.black,
//                           ),
//                           SizedBox(
//                             width: 1 * SizeConfig.widthMultiplier,
//                           ),
//                           Text(
//                             "Waiting vendor to respond to your request",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 2.5 * SizeConfig.textMultiplier,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'OpenSans-Bold'),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                  :Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color:  Color(0XffFAF0DA)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Icon(
//                             Icons.send,
//                             color: Colors.black,
//                           ),
//                           SizedBox(
//                             width: 1 * SizeConfig.widthMultiplier,
//                           ),
//                           Text(
//                             "Send request TO waiting List",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 2.5 * SizeConfig.textMultiplier,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'OpenSans-Bold'),
//                           )
//                         ],
//                       ),
//                     ),
//                   )
                  
//                 ),
//               )
//             ],
//           ),
//         ),
//         body:
//          CustomScrollView(slivers: <Widget>[
//           SliverAppBar(
//             iconTheme: IconThemeData(
//               color: Colors.black, //change your color here
//             ),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: Color(0XffFAF0DA),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10.0),
//                           )),
//                       child: IconButton(
//                           icon: Icon(Icons.shopping_cart),
//                           iconSize: 6 * SizeConfig.imageSizeMultiplier,
//                           onPressed: () {
//                             // int index = _userInformations.cart.indexWhere((map) => map.containsKey(widget.tasks.jobid));
//                             //print(_userInformations.cart[index][widget.tasks.jobid][1]);
//                             //HomeProducts
//                             /*if(_userInformations.cart.first.containsKey(widget.tasks.jobid)){
//                             print('true');
//                           }else{
//                             print('false');
//                           };*/
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => UserCart(),
//                               ),
//                             );
//                           })),
//                 ),
//                 SizedBox(width: 2.5 * SizeConfig.widthMultiplier),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color(0XffFAF0DA),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10.0),
//                         )),
//                     child: isLoading
//                         ? CircularProgressIndicator()
//                         : IconButton(
//                             icon: isFavorite
//                                 ? Icon(Icons.favorite, color: Colors.black)
//                                 : Icon(Icons.favorite_border,
//                                     color: Colors.black),
//                             iconSize: 6 * SizeConfig.imageSizeMultiplier,
//                             onPressed: () {
//                               setState(() {
//                                 isLoading = true;
//                               });
//                               favoriteChecking();
//                             }),
//                   ),
//                 ),
//               ],
//             ),
//             backgroundColor: const Color(0xFFE9E9E9), //0xFF200087),
//             expandedHeight: 300,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(40))),
//             flexibleSpace: FlexibleSpaceBar(
//               background: ClipRRect(
//                 borderRadius:
//                     BorderRadius.vertical(bottom: Radius.circular(40)),
//                 child: Swiper(
//                   itemCount: widget.tasks.images.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return new CachedNetworkImage(
//                       imageUrl: widget.tasks.images[index],
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => CircularProgressIndicator(
//                           valueColor:
//                               new AlwaysStoppedAnimation<Color>(Colors.white)),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     );
//                   },
//                   pagination: new SwiperPagination(),
//                   control: new SwiperControl(),
//                 ),
//               ),
//             ),
//           ),
//           SliverList(
//               delegate: SliverChildListDelegate([
//             SizedBox(
//               height: 5 * SizeConfig.heightMultiplier,
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 85 * SizeConfig.heightMultiplier,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(40.0),
//                     topLeft: Radius.circular(40.0),
//                   )),
//               child: Container(
//                   //crossAxisAlignment: CrossAxisAlignment.start,
//                   child: Wrap(
//                 //crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20.0, top: 30),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           "RWF ${widget.tasks.productPrice}",
//                           style: TextStyle(
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'OpenSans'),
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Icon(Icons.remove_red_eye),
//                             SizedBox(
//                               width: 1 * SizeConfig.widthMultiplier,
//                             ),
//                             Text(
//                               "${widget.tasks.viewsIncrement.toString()} views",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'OpenSans'),
//                             ),
//                             SizedBox(
//                               width: 1 * SizeConfig.widthMultiplier,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20.0, top: 20.0, bottom: 20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           "${widget.tasks.productName}",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 4.5 * SizeConfig.textMultiplier,
//                               fontFamily: 'OpenSans'),
//                         ),
//                         Row(
//                           children: <Widget>[
//                             isLoadingLikes
//                                 ? CircularProgressIndicator()
//                                 : IconButton(
//                                     icon: isPostLiked
//                                         ? Icon(Icons.check, color: Colors.green)
//                                         : Icon(
//                                             Icons.check,
//                                           ),
//                                     iconSize:
//                                         6 * SizeConfig.imageSizeMultiplier,
//                                     onPressed: () {
//                                       setState(() {
//                                         isLoadingLikes = true;
//                                       });
//                                       likeschecking();
//                                     }),
//                             SizedBox(
//                               width: 1 * SizeConfig.widthMultiplier,
//                             ),
//                             Text(
//                               "${widget.tasks.likesIncrement.toString()} Likes",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: 'OpenSans'),
//                             ),
//                             SizedBox(
//                               width: 1 * SizeConfig.widthMultiplier,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 20, right: 20, top: 30),
//                     child: Row(
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Column(
//                               children: <Widget>[
//                                 Text(
//                                   "RWF ${widget.tasks.productPrice}",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 3 * SizeConfig.textMultiplier,
//                                       fontFamily: 'OpenSans'),
//                                 ),
//                                 Text(
//                                   "1-100 pieces",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       // fontWeight: FontWeight.bold,
//                                       fontSize: 3 * SizeConfig.textMultiplier,
//                                       fontFamily: 'OpenSans'),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 5 * SizeConfig.widthMultiplier,
//                             ),
//                             Column(
//                               children: <Widget>[
//                                 Text(
//                                   "RWF 6000",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 3 * SizeConfig.textMultiplier,
//                                       fontFamily: 'OpenSans'),
//                                 ),
//                                 Text(
//                                   "100-500 pieces",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       // fontWeight: FontWeight.bold,
//                                       fontSize: 3 * SizeConfig.textMultiplier,
//                                       fontFamily: 'OpenSans'),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 3 * SizeConfig.widthMultiplier,
//                             ),
//                             Column(
//                               children: <Widget>[
//                                 Text(
//                                   "RWF 4500",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 3 * SizeConfig.textMultiplier,
//                                       fontFamily: 'OpenSans'),
//                                 ),
//                                 Text(
//                                   "500-1000 pieces",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       // fontWeight: FontWeight.bold,
//                                       fontSize: 3 * SizeConfig.textMultiplier,
//                                       fontFamily: 'OpenSans'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20.0, top: 20.0),
//                     child: Text(
//                       "${widget.tasks.productDetails}",
//                       style: TextStyle(
//                           color: Colors.black,
//                           letterSpacing: 0.2,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 2.5 * SizeConfig.textMultiplier,
//                           fontFamily: 'OpenSans'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20.0, right: 20.0, top: 30.0),
//                     child: Row(
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   border: Border.all(color: Colors.grey)),
//                               child: Icon(
//                                 Icons.add,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 3 * SizeConfig.widthMultiplier,
//                             ),
//                             Text(
//                               "01",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 3 * SizeConfig.textMultiplier,
//                                   fontFamily: 'OpenSans'),
//                             ),
//                             SizedBox(
//                               width: 3 * SizeConfig.widthMultiplier,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   border: Border.all(color: Colors.grey)),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 5.0, right: 5.0),
//                                 child: Text(
//                                   "-",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 3 * SizeConfig.textMultiplier,
//                                       fontFamily: 'OpenSans'),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         Text(
//                           "Rwf ${widget.tasks.productPrice}",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 3 * SizeConfig.textMultiplier,
//                               fontFamily: 'OpenSans-Bold'),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2 * SizeConfig.heightMultiplier,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 20.0, right: 20.0, top: 40.0),
//                     child: Row(
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Icon(
//                               Icons.verified_user,
//                               color: Colors.redAccent,
//                             ),
//                             SizedBox(
//                               width: 3 * SizeConfig.widthMultiplier,
//                             ),
//                             Text(
//                               "${widget.tasks.username}",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 0.2,
//                                   fontSize: 2.5 * SizeConfig.textMultiplier,
//                                   fontFamily: 'OpenSans'),
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Color(0XffFAF0DA),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10.0),
//                               )),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: InkWell(
//                               onTap: () => Navigator.of(context)
//                                   .push(new MaterialPageRoute(
//                                 builder: (context) => new UserProfile(
//                                   postUid: widget.tasks.userUid,
//                                 ),
//                               )),
//                               child: Text(
//                                 " view profile",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 0.2,
//                                     fontSize: 2.5 * SizeConfig.textMultiplier,
//                                     fontFamily: 'OpenSans'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 3 * SizeConfig.heightMultiplier,
//                   ),
//                 ],
//               )),
//             ),
//           ]))
//         ]));
//   }

 
//   void _submitToCartList(User user, UsersInformations usersInformations) async {
   
//     String postidUid = Uuid().v4();
//     final _user = Provider.of<User>(context);
//     Firestore.instance.collection('Users').document(_user.uid).collection("cartList").document(widget.tasks.jobid).setData({
//       'postidUid':postidUid,
//       'productImage':widget.tasks.images[0],
//       'productName':widget.tasks.productName,
//       'productPrice':widget.tasks.productPrice,
//       'buyerUserName':user.displayName,
//       'buyerEmail':user.email,
//       'buyerUid':user.uid,
//       'VendorName':widget.tasks.username,
//       'VendorUuid':widget.tasks.userUid,
//       'productPostId': widget.tasks.jobid
      

//     });
//     await  Firestore.instance.collection("Users")
//     .document(widget.tasks.userUid)
//     .collection("OderedOders")
//     .document(postidUid)
//     .setData({
//      'postidUid':postidUid,
//       'productImage':widget.tasks.images[0],
//       'productName':widget.tasks.productName,
//       'productPrice':widget.tasks.productPrice,
//       'buyerUserName':user.displayName,
//       'buyerEmail':user.email,
//       'buyerUid':user.uid,
//       'VendorName':widget.tasks.username,
//       'VendorUuid':widget.tasks.userUid,
//       'productPostId': widget.tasks.jobid
//       })
//     .catchError((e) {
//       print(e);
//     });
//     Firestore.instance.collection('Users').document(_user.uid).updateData({
//       'listOfCarts': FieldValue.arrayUnion([widget.tasks.jobid]),
//       'OrderStatus.${widget.tasks.jobid}': false,
//     });
//     print("Added");
//   }

// }

//  showAlertDialog(BuildContext context,Function addToCartList) {
//    final _user = Provider.of<User>(context);
//     final _userInformations = Provider.of<UsersInformations>(context);
//     // set up the buttons
//     Widget cancelButton = FlatButton(
//       child: Text("Cancel"),
//       onPressed: () { Navigator.of(context, rootNavigator: true)
//                   .pop();},
//     );
//     Widget continueButton = FlatButton(
//       child: Text("Confirm"),
//       onPressed: () async{
        
//          await addToCartList(_user,_userInformations);
//          print ("button pressed");
//          Navigator.of(context, rootNavigator: true)
//                   .pop();
//            Fluttertoast.showToast(msg: 'product added');
//       },
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Confirm Request"),
//       content: Text(
//           "If your press confirm , the vendor will be notified about your request; to cancel the order press cancel "),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }


