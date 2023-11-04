import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        child: "Cart is empty".text.color(darkFontGrey).makeCentered(),
      ),
    );
  }
}