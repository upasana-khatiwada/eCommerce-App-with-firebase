import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:flutter/material.dart';

Widget appLogoWidget() {
  return Container(
    decoration: BoxDecoration(
      //color: whiteColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),

//filling the color
      child: ColorFiltered(
          colorFilter: const ColorFilter.mode(whiteColor, BlendMode.srcIn),
          child: Image.asset(
            icOnlineShopping,
            width: 77,
            height: 77,
          )),
    ),
  );
}
