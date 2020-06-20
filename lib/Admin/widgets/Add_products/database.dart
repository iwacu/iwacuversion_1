// import 'package:bwiza_version_1/models/Post.dart';
// import 'package:bwiza_version_1/models/UsersInforamtions.dart';
// import 'package:bwiza_version_1/models/cart.dart';
// import 'package:bwiza_version_1/models/shops.dart';
// import 'package:bwiza_version_1/models/vendorOders.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:scoped_model/scoped_model.dart';

// class DatabaseService extends Model {
//   final String uid;
//   final String postId;
//   DatabaseService({this.postId, this.uid});
//   // collection reference
//   final CollectionReference postCollection =
//       Firestore.instance.collection('Post');
//    final CollectionReference shopCollection =
//       Firestore.instance.collection('Shop');    
//   final CollectionReference userInformationCollection =
//       Firestore.instance.collection('Users');
//   //update UserInforamtion when registering
//   Future<void> updateUserData(String email, String displayName) async {
//     return await userInformationCollection.document(uid).setData({
//       'Cart': [],
//       'Shops':[],
//       'OderStatus': {},
//       'OderedOders': [],
//       'OderedOdersUids': [],
//       'uid': uid,
//       'email': email,
//       'displayName': displayName,
//       'favorites': [],
//       'followers': "",
//       'following': "",
//       'fullName': "",
//       'gender': "",
//       'listOfCarts': [],
//       'location': "",
//       'phone': "",
//       'photoUrl': "",
//       'posts': "",
//       'uid': "",
//     });
//   }

//   UsersInformations _userDetailListFromSnaphot(DocumentSnapshot snapshot) {
//     return UsersInformations(
//       uid: snapshot.data['uid'] ?? '',
//       email: snapshot.data['email'] ?? '',
//       photoUrl: snapshot.data['photoUrl'] ?? '',
//       gender: snapshot.data['gender'] ?? '',
//       favorites: snapshot.data['favorites'] ?? [],
//       listOfCarts: snapshot.data['listOfCarts'] ?? [],
//       cart: List.from(snapshot.data['Cart']) ?? [],
//       orderStatus: snapshot.data['OrderStatus'] ?? [],
//       displayName: snapshot.data['displayName'] ?? '',
//       //orderedOrders:List.from(snapshot.data['OrderedOrders'])??[],
//       oderedList: snapshot.data['OrderedOrdersUids'] ?? [],
//       shops: List.from(snapshot.data['Shops']) ?? [],
      
//     );
//   }

//   Stream<UsersInformations> get userInformations {
//     return userInformationCollection
//         .document(uid)
//         .snapshots()
//         .map(_userDetailListFromSnaphot);
//   }

// //maping snapshot gotten from firestore to PostDetail
//   List<PostDetail> _postDetailListFromSnaphot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return PostDetail(
//         productBrand: doc.data['productBrand'] ?? '',
//         productDetails: doc.data['productDetails'] ?? '',
//         productName: doc.data['productName'] ?? '',
//         phone: doc.data['productPhone'] ?? '',
//         productPrice: doc.data['productPrice'] ?? '',
//         productQuality: doc.data['productQuality'] ?? '',
//         username: doc.data['email'] ?? '',
//         userUid: doc.data['userUid'] ?? '',
//         jobid: doc.data['jobid'] ?? '',
//         views: List.from(doc.data['views']) ?? '',
//         images: List.from(doc.data['images']) ?? '',
//         likes: doc.data['likes'] ?? '',
//         viewsIncrement: doc.data['viewsIncrement'] ?? '',
//         shopName: doc.data['Shop'] ?? '',
//         productCategory: doc.data['Shop_category'] ?? ''
//         // likesIncrement: doc.data['likesIncrement'] ?? '',
//         //   views: doc.data['views'] ?? '',
//       );
//     }).toList();
//   }

//   //getting Posted details from firestore then map..
//   Stream<List<PostDetail>> get postDetail {
//     return postCollection.snapshots().map(_postDetailListFromSnaphot);
//     //  .map(_userDataFromSnapshot);
//   }

//   //get Oders on vendor side
//   List<VendorOders> _vendorOdersListFromSnaphot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return VendorOders(
//        buyerDisplayName: doc.data['buyerUserName'] ?? '',
//         buyerEmail: doc.data['buyerEmail'],
//         buyerUId: doc.data['buyerUid'],
//         postUid: doc.data['postuuid'] ?? '',
//         productPicture: doc.data['productImage'] ?? '',
//         productName: doc.data['productName'] ?? '',
//         productPrice: doc.data['productPrice'] ?? '',
//       );
//     }).toList();
//   }

//   Stream<List<VendorOders>> get vendorOdersList {
//     return userInformationCollection
//         .document(uid)
//         .collection("OderedOders")
//         .snapshots()
//         .map(_vendorOdersListFromSnaphot);
//   }
//   //get uesrCart lIST
//    List<Carts> _cartListFromSnaphot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return Carts(
//         buyerDisplayName: doc.data['buyerUserName'] ?? '',
//         buyerEmail: doc.data['buyerEmail'],
//         buyerUId: doc.data['buyerUid'],
//         postUid: doc.data['postidUid'] ?? '',
//         productPicture: doc.data['productImage'] ?? '',
//         productName: doc.data['productName'] ?? '',
//         productPrice: doc.data['productPrice'] ?? '',
//         productPostId: doc.data['productPostId'] ?? '',
//         vendorUid: doc.data['VendorUuid'] ?? '',
//       );
//     }).toList();
//   }
//   Stream<List<Carts>> get cartList {
//     return userInformationCollection
//         .document(uid)
//         .collection("cartList")
//         .snapshots()
//         .map(_cartListFromSnaphot);
//   }
//   //get shops
//    List<Shops> _shopListFromSnaphot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return Shops(
//        categories: List.from(doc.data['categories']) ?? '',
//        companyName: doc.data['companyName'] ?? '',
//        images:  List.from(doc.data['images']) ?? '',
//        locationCompany: doc.data['locationComapny'] ?? '',
//        phonenUmberComapny: doc.data['phoneNumberComapny'] ?? '',
//        registersUserEmail: doc.data['registerEmail'] ?? '',
//        registersUserUId: doc.data['registeredUser'] ?? ''
//       );
//     }).toList();
//   }
//    Stream<List<Shops>> get shopsList {
//     return  shopCollection.snapshots().map(_shopListFromSnaphot);
//   }
// }
