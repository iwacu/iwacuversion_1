import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iwacu_version1/Models/post.dart';
import 'package:iwacu_version1/Models/usersInformations.dart';
import 'package:scoped_model/scoped_model.dart';

class DatabaseService extends Model {
  final String uid;
  final String postId;
  DatabaseService({this.uid, this.postId});

  //Collection Reference
  final CollectionReference userInformationCollection =
      Firestore.instance.collection('Users');
  final CollectionReference postCollection =
      Firestore.instance.collection('Post');

  //update UserInforamtion when registering
  Future<void> updateUserData(String email, String fullName, String userName,
      String phoneNumber, String location) async {
    await userInformationCollection.document(uid).setData({
      'OderStatus': {},
      'uid': uid,
      'email': email,
      'userName': userName,
      'favorites': [],
      'fullName': fullName,
      'location': location,
      'admin': false
    });
  }

  //get users information from firebase
  UsersInformations _userDetailListFromSnaphot(DocumentSnapshot snapshot) {
    return UsersInformations(
      uid: snapshot.data['uid'] ?? '',
      email: snapshot.data['email'] ?? '',
      photoUrl: snapshot.data['photoUrl'] ?? '',
      gender: snapshot.data['gender'] ?? '',
      displayName: snapshot.data['displayName'] ?? '',
      fullName: snapshot.data['fullName'] ?? '',
      adminSide: snapshot.data['admin'] ?? '',
    );
  }

  Stream<UsersInformations> get userInformations {
    return userInformationCollection
        .document(uid)
        .snapshots()
        .map(_userDetailListFromSnaphot);
  }

  //getting product post from firebase
  List<Post> _postDetailListFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Post(
        productName: doc.data['productName'] ?? '',
       productPriceRange: List.from(doc.data['priceRanges']) ?? '',
        images: doc.data['images'] ?? '',
        colors: doc.data['Colors'] ?? '',
        productCategory: doc.data['productCategory'] ?? '',
      );
    }).toList();
  }

  //getting Posted details from firestore then map..
  Stream<List<Post>> get postDetail {
    return postCollection.snapshots().map(_postDetailListFromSnaphot);
    //  .map(_userDataFromSnapshot);
  }
}
