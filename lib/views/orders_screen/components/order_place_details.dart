import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget orderPlaceDetails({data,}){
  return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    "Order Code ".text.fontFamily(semibold).make(),
                    "${data['order_code']}".text.color(bermudaGrey).fontFamily(semibold).make(),
                  ],),
                  Column(
                   children: [
                    "Shipping method".text.fontFamily(semibold).make(),
                    "${data['shipping_method']}".text.make(),
                   ],
                  )
                ],
              ),
            );
}