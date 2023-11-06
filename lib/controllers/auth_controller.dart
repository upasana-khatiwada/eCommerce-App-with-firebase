
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

// class AuthController extends GetxController {
//   //textController
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   //login  method
//   Future<UserCredential?> loginMethod({context}) async {
//     //this function has a nullable return type of 'FutureOr<UserCredentials>'
//     UserCredential? userCredential;

//     try {
//       await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

//   //signup  method
//   Future<UserCredential?> signupMethod({email, password, context}) async {
//     //this function has a nullable return type of 'FutureOr<UserCredentials>'
//     UserCredential? userCredential;

//     try {
//        userCredential = await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

//   //storing data method
//   storeUserData({name, password, email}) async {
//     DocumentReference store =
//         firestore.collection(usersCollections).doc(currentUser!.uid);
//     store.set({
//       'name': name,
//       'password': password,
//       'email': email,
//       'imageUrl': '',
//     });
//   }

//   //signout method
//   signoutMethod(context) async{
//     try{
//       await auth.signOut();
//     }catch(e){
//       VxToast.show(context, msg: e.toString());
//     }
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  var isloading = false.obs;

  // text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data to cloud store method
  storeUserData({name, email, password}) async {
    DocumentReference store =
        firestore.collection(usersCollections).doc(currentUser!.uid);
    store.set({
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': '',
       'id': currentUser!.uid,
      // 'cart_count': "00",
      // 'order_count': "00",
      // 'wishlist_count': "00",
    });
  }

  // signout method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}