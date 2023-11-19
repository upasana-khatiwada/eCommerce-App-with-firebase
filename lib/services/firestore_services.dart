import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';

class FirestoreServices{
//get users data from firestore
  static getUser(uid){
    return firestore.collection(usersCollections).where('id',isEqualTo: uid).snapshots();
  }
  //get products according to category

   static getProducts(category){
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
   }

  //   static getSubCategoryProducts(title){
  //    return firestore.collection(productsCollection).where('p_subcategory', isEqualTo: title ).snapshots();

  //  }

 //get cart
   static getCart(uid){
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
   }

   //delete document
   static deleteDocument(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
   }
}