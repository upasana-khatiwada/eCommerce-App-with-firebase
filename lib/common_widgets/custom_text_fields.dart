import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({String? hint, String? title, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(bermudaGrey).fontFamily("sans_bold").size(21).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration:  InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: "sans_semibold",
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true, //to make it little small
          fillColor: lightGrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: const OutlineInputBorder(
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