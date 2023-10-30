import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({String? hint, String? title, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      email.text.color(bermudaGrey).fontFamily("sans_bold").size(21).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: const InputDecoration(
          hintStyle: TextStyle(
            fontFamily: "sans_semibold",
            color: textfieldGrey,
          ),
          hintText: emailHint,
          isDense: true, //to make it little small
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bermudaGrey,
            ),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}


//