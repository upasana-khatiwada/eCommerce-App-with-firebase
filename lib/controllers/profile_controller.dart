import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController{

  var profileImgPath = ''.obs;

  changeImage(context) async{
   try{
     final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
    if(img == null) return;
    profileImgPath.value = img.path;
   }on PlatformException catch (e){
    VxToast.show(context, msg: e.toString());
   }
  }
}