import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';



class DatabaseService extends Model{
  final String uid;
  final String postId;
  DatabaseService({this.uid,this.postId});

  //Collection Reference
  final CollectionReference userInformationCollection =
      Firestore.instance.collection('Users');

   //update UserInforamtion when registering
  Future<void> updateUserData(String email,String fullName,String userName,String phoneNumber,String location) async {
      
   await userInformationCollection.document(uid).setData({
      
      'OderStatus': {},
      'uid': uid,
      'email': email,
      'userName':userName,
      'favorites': [],
      'fullName': fullName,
      'location':location
      
    });
  }
    
}