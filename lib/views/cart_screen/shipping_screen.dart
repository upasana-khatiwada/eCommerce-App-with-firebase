import 'package:ecommerce_app_with_firebase/common_widgets/custom_text_fields.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/cart_controller.dart';
import 'package:ecommerce_app_with_firebase/views/cart_screen/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
     var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: myButton(
          onPress: () {
            if(controller.addressController.text.length > 5 && (controller.phoneController.text.length == 10)){
               Get.to(()=> const PaymentMethods());
            }else {
              VxToast.show(context, msg: "Please, Fill the form");
            }
          },
          color: bermudaGrey,
          textColor: whiteColor,
          title: "Continue",
        ),
      ),
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              customTextField(
                  hint: "Address",
                  isPass: false,
                  title: "Address",
                  controller: controller.addressController),
              customTextField(
                  hint: "City",
                  isPass: false,
                  title: "City",
                  controller: controller.cityController),
              customTextField(
                  hint: "State",
                  isPass: false,
                  title: "State",
                  controller: controller.stateController),
              customTextField(
                  hint: "Postal Code",
                  isPass: false,
                  title: "Postal Code",
                  controller: controller.postalController),
              customTextField(
                  hint: "Phone",
                  isPass: false,
                  title: "Phone",
                  controller: controller.phoneController),
            ],
          ),
        ),
      ),
    );
  }
}
