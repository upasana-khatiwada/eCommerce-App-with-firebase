import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: myButton(
          onPress: () async {
            controller.placeMyOrder(orderPaymentMethod:paymentMethods[controller.paymentIndex.value],totalAmount: controller.totalP.value );
          },
          color: bermudaGrey,
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
        child: Obx(
          () => Column(
            children: List.generate(paymentMehodsImg.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.changePaymentIndex(index);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: controller.paymentIndex.value == index
                            ? Colors.green
                            : Colors.transparent,
                        width: 4),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        paymentMehodsImg[index],
                        width: double.infinity,
                        height: 120,
                        //blendmode and color so that text is visible for selected container
                        colorBlendMode: controller.paymentIndex.value == index
                            ? BlendMode.darken
                            : BlendMode.color,
                        color: controller.paymentIndex.value == index
                            ? Colors.black.withOpacity(0.4)
                            : Colors.transparent,
                        fit: BoxFit.cover,
                      ),
                      controller.paymentIndex.value == index
                          ? Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                activeColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                value: true,
                                onChanged: (value) {},
                              ),
                            )
                          : Container(),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: paymentMethods[index]
                              .text
                              .white
                              .fontFamily(fontBold)
                              .size(16)
                              .make()),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
