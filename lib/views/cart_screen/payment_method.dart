import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: myButton(
          onPress: () async {},
          color: redColor,
          textColor: whiteColor,
          title: "Place my order",
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: List.generate(paymentMehodsImg.length, (index) {
            return Container(
               clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: bermudaGrey,
                  width: 4),
              ),
              margin: const EdgeInsets.only(bottom: 8),
              child: Image.asset(
                paymentMehodsImg[index],
                width: double.infinity,
                height: 120,
                //  colorBlendMode:  controller.paymentIndex.value == index ? BlendMode.darken : BlendMode.color,
                fit: BoxFit.cover,
              ),
            );
          }),
        ),
      ),
    );
  }
}
