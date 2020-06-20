// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:iwacu_version1/Models/user.dart';
// import 'package:iwacu_version1/Models/usersInformations.dart';
// import 'package:iwacu_version1/themes/light_color.dart';
// import 'package:iwacu_version1/themes/theme.dart';
// import 'package:iwacu_version1/themes/title_text.dart';
// import 'package:provider/provider.dart';

// class UserCart extends StatefulWidget {
//   @override

//   _UserCartState createState() => _UserCartState();
// }
// class _UserCartState extends State<UserCart> {
//      Widget _title(List<dynamic>  _vendorOdersList,) {
//     return Container(
//         margin: AppTheme.padding,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 TitleText(
//                   text: 'Cart',
//                   fontSize: 27,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 TitleText(
//                   text: 'list',
//                   fontSize: 27,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ],
//             ),
//             Spacer(),
//            // Text("Total Oders: 4",style: kCaptionTextStyle,),
//             Container(
//               padding: EdgeInsets.all(10),
//               //child: Text("Total Oders: 4",style: kCaptionTextStyle,),
//               child: 
//               Column(
//                 children: <Widget>[
//              Container(
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(13))
//                ),
//               padding: EdgeInsets.all(10),
//               child: Icon(
//                 Icons.delete_outline,
//                 color: LightColor.orange,
//               ),
//             )
//             //.ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13))
//            ,
            
//                   TitleText(
//                       text: 'Total items: ${ _vendorOdersList.length}',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                     ),
//                 ],
//               ),
//               // Icon(
//               //   Icons.delete_outline,
//               //   color: LightColor.orange,
//               // ),
//             ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
//           ],
//         ));
//   }
//   Widget _appBar() {
//     return Container(
//       padding: AppTheme.padding,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           RotatedBox(
//             quarterTurns: 4,
//             child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child:Icon(Icons.arrow_back_ios, color: Colors.black54)),
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(13)),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).backgroundColor,
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                       color: Color(0xfff8f8f8),
//                       blurRadius: 10,
//                       spreadRadius: 10),
//                 ],
//               ),
//               child: Image.asset("assets/user.png"),
//             ),
//           ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
//         ],
//       ),
//     );
//   }
//  Widget _item( 

//    Carts _cartList,
//    User _user){
   
//         return Container(
//           height: 80,
//           child: Row(
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: 1.2,
//                 child: Stack(
//                   children: <Widget>[
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Container(
//                         height: 70,
//                         width: 70,
//                         child: Stack(
//                           children: <Widget>[
//                             Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     CachedNetworkImage(
//                     //  height: 78,
//                       //width: 81,
//                        imageUrl: _cartList.productPicture,
//                         fit: BoxFit.contain,
//                         placeholder: (context, url) => CircularProgressIndicator(
//                             valueColor:
//                                 new AlwaysStoppedAnimation<Color>(Colors.white)),
//                         errorWidget: (context, url, error) => Icon(Icons.error),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: ListTile(
//                       title: TitleText(
//                         text:_cartList.productName,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       subtitle: Row(
//                         children: <Widget>[
//                           TitleText(
//                             text: 'RWF ',
//                             color: LightColor.red,
//                             fontSize: 12,
//                           ),
//                           TitleText(
//                             text: _cartList.productPrice,
//                             fontSize: 14,
//                           ),
//                         ],
//                       ),
//                       trailing: GestureDetector(
//                         onTap: () => removeItem(_cartList,_user),
//                                               child: Icon(
//                 Icons.delete_outline,
//                 color: LightColor.orange,
//               ),
//                       ),
//                       // Container(
//                       //   width: 35,
//                       //   height: 35,
//                       //   alignment: Alignment.center,
//                       //   decoration: BoxDecoration(
//                       //       color: LightColor.lightGrey.withAlpha(150),
//                       //       borderRadius: BorderRadius.circular(10)),
//                       //   child:,
//                       // )
//                       ))
//             ],
//           ),
//         );
      
//   }
 
//  Widget _items(
//     List<Carts> _cartList,
//     User _user
//  ){
// return  ListView.builder(
//                         shrinkWrap: true,
//                         //scrollDirection: Axis.vertical,
//                         physics: ScrollPhysics(),
//                         itemCount: _cartList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           print( _cartList[index].productName);
//                                     return Column(
//                                         children: <Widget>[
//                   SizedBox(height: 10,),
//                   ExpansionTile(
//                     title: _item(
//                        _cartList[index],
//                        _user
//                     ),
//                     children: <Widget>[
//                           Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children:<Widget>[

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children:<Widget>[
//                       Text("Buyer_Name",style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
//                     Text(_cartList[index].buyerDisplayName,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
//                       ]
//                       ),
//                     SizedBox(height: 12,),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                     Text("Buyer_email",style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
//                     Text(_cartList[index].buyerEmail,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
//                     ],
//                 ),
//                 SizedBox(height: 12,),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                     Text("Phone_Number",style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
//                     Text("0786494863",style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
//                     ],
//                 ),
//                 SizedBox(height: 20,),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                     Text("Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
//                     Text("RWF 23000",style: TextStyle(color:Colors.green,fontSize: 22,fontWeight: FontWeight.bold),),
//                     ],
//                 ),
//                 SizedBox(height: 20,),
//                 Text("Address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
//                 SizedBox(height: 12,),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                     Text("725 5th Ave,\nNY 10024 New York",style: TextStyle(fontSize: 14,color: Colors.grey.shade500,height: 1.4),),
//                     Text("Change",style: TextStyle(fontSize: 14,color: Colors.amber),),
//                     ],
//                 ),

//                 Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Container(
//                     height: 80,
//               width: double.infinity,
//               padding: EdgeInsets.all(16),
//               child:FlatButton(
//                  onPressed: (){},
//                 child: Text("ORDER Placed,waiting supplier to contact you",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                 color: Colors.green,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4),
//                 ),
//                  )
              
//                     )
//                 )],
//                     )
              
//                     ],
//                   ),
//                                         ],
//                                       );
//                                     //////////////////////////////////////
                              
//                         });
//  }
//   @override
//   Widget build(BuildContext context) {
//     final _userInformations = Provider.of<UsersInformations>(context);
//     final _user = Provider.of<User>(context);
//     final _cartList = Provider.of<List<Carts>>(context)?? [];
//     return Scaffold(
//        body: Padding(
//         padding: const EdgeInsets.only(top:20.0),
//         child: Column(
//           children: <Widget>[
//                  _appBar(),
//              _title(_userInformations.listOfCarts),
//              Expanded(
//                child: _items(
//                 _cartList,
//                 _user
//                )),
//           ],
//         ),
//         ),
    
//     );
//   }
//   void removeItem(
//      Carts _cartList,
//    User _user
//   ) async {
//    await Firestore.instance.collection("Users").document(_user.uid).updateData({
//           'listOfCarts': FieldValue.arrayRemove([_cartList.productPostId]),
//           'OrderStatus.${_cartList.productPostId}':false,
//         });
//      await   Firestore.instance.collection("Users")
//     .document(_cartList.vendorUid)
//     .collection("OderedOders")
//     .document(_cartList.postUid)
//    .delete();    
//    await   Firestore.instance.collection("Users")
//     .document(_user.uid)
//     .collection("cartList")
//     .document(_cartList.productPostId)
//    .delete();    

//   }
// }