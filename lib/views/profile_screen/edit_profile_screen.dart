import 'dart:io';

import 'package:ecommerce_app_with_firebase/common_widgets/bg_widget.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/custom_text_fields.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     var controller = Get.find<ProfileController>();
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Obx(()=> SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             controller.profileImgPath.isEmpty? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(): Image.file(File(controller.profileImgPath.value),
                  width: 100,
                  fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              myButton(
                  color: bermudaGrey,
                  onPress: () {
                   controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              //edit name
              customTextField(hint: nameHint, title: name, isPass: false),
              10.heightBox,
              //write old password
              customTextField(hint: passwordHint, title: oldpass, isPass: true),
              10.heightBox,
              //write new password
              customTextField(hint: passwordHint, title: newpass, isPass: true),
              20.heightBox,
              SizedBox(
                 width: context.screenWidth - 60,
                child: myButton(color: bermudaGrey,onPress: (){}, textColor: whiteColor,title: "Save")),
            ],
          ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50,left: 12, right: 12)).rounded.make(),
        ),
      ),
    ));
  }
}
