import 'package:ecommerce_app_with_firebase/common_widgets/bg_widget.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/views/category_screen/items_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(fontBold).white.make(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(
                  6,
                  (index) => "woman's dress"
                      .text
                      .size(12)
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .makeCentered()
                      .box
                      .white
                      .roundedSM
                      .size(120, 60)
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .make()
                      .onTap(() {})),
            ),
          ),
          20.heightBox,
          //items container
          Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          height: 150,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        "Laptop 4gb/64"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "\$600"
                            .text
                            .color(bermudaGrey)
                            .fontFamily(fontBold)
                            .size(16)
                            .make(),
                      ],
                    )
                        .box
                        .white
                        .margin(const EdgeInsets.symmetric(horizontal: 5))
                        .roundedSM
                        .outerShadowSm
                        .color(whiteColor)
                        .padding(const EdgeInsets.all(12))
                        .make().onTap(() {
                          Get.to(()=> const ItemDetails(title: "Dummy item"));
                        });
                  }))
        ],
      ),
    ));
  }
}
