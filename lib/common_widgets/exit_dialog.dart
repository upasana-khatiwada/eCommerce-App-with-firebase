import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialog(context) {
  return Dialog(
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      "Confirm".text.fontFamily(fontBold).size(18).color(darkFontGrey).make(),
      const Divider(),
      10.heightBox,
      "Are you sure you want to exit?".text.size(16).color(darkFontGrey).make(),
      10.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          myButton(
            color: bermudaGrey,
            onPress: () {
              SystemNavigator.pop();
            },
            textColor: whiteColor,
            title: "Yes",
          ),
          myButton(
            color: bermudaGrey,
            onPress: () {
              Navigator.pop(context);
            },
            textColor: whiteColor,
            title: "No",
          ),
        ],
      )
    ]).box.color(lightGrey).padding(const EdgeInsets.all(12)).roundedSM.make(),
  );
}
