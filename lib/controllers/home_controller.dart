import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
@override
void onInit(){
  getUsername();
  super.onInit();
}                                             

  var currentNavIndex = 0.obs;
   var username = '';

   getUsername() async{
     var n = await firestore.collection(usersCollections).where('id', isEqualTo: currentUser!.uid).get().then((value){
       if(value.docs.isNotEmpty){
         return value.docs.single['name'];
       }
     });
     username = n;
   }
}