import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';

class FirestoreServices{
//get users data from firestore
  static getUser(uid){
    return firestore.collection(usersCollections).where('id',isEqualTo: uid).snapshots();
  }
}