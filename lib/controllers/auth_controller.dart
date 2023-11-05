
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  //login  method
  Future<UserCredential?> loginMethod({email, password, context}) async {
    //this function has a nullable return type of 'FutureOr<UserCredentials>'
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup  method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    //this function has a nullable return type of 'FutureOr<UserCredentials>'
    UserCredential? userCredential;

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(usersCollections).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
    });
  }

  //signout method
  signoutMethod(context) async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}
