import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: title!.text.color(darkFontGrey).fontFamily(fontBold).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //swiper section
                        VxSwiper.builder(
                            itemCount: 3,
                            autoPlay: true,
                            height: 350,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                imgFc5,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),
                        10.heightBox,
                        //title and details section
                        title!.text
                            .size(16)
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        10.heightBox,
                        //rating
                        VxRating(
                          //isSelectable: false,
                          onRatingUpdate: (value) {},
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          count: 5,
                          size: 25,
                          // maxRating: 5,
                        ),
                        10.heightBox,
                        "\$30,000"
                            .text
                            .fontFamily(semibold)
                            .color(bermudaGrey)
                            .make(),
                        10.heightBox,

                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller".text.black.fontFamily(semibold).make(),
                                5.heightBox,
                                "In Mouse brand"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make()
                              ],
                            )),
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.message_rounded,
                                color: darkFontGrey,
                              ),
                            ).onTap(() {})
                          ],
                        )
                            .box
                            .height(60)
                            .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .color(textfieldGrey)
                            .make(),

                        //Color Section
                        20.heightBox,
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Color: "
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ),
                                Row(
                                  children: List.generate(
                                      3,
                                      (index) => VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Vx.randomPrimaryColor)
                                          .margin(const EdgeInsets.symmetric(
                                              horizontal: 4))
                                          .make()),
                                ),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                            //quantity row
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Quantity:"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.remove)),
                                    "0"
                                        .text
                                        .size(16)
                                        .color(darkFontGrey)
                                        .fontFamily(fontBold)
                                        .make(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                    10.widthBox,
                                    "(0 available)"
                                        .text
                                        .color(textfieldGrey)
                                        .make(),
                                  ],
                                ),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                            //total row
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child:
                                      "Total:".text.color(textfieldGrey).make(),
                                ),
                                "\$0.00"
                                    .text
                                    .color(bermudaGrey)
                                    .size(16)
                                    .fontFamily(fontBold)
                                    .make(),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                          ],
                        ).box.white.shadowSm.make(),

                        //description section
                        10.heightBox,
                        "Description"
                            .text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        10.heightBox,
                        "this is a dummy item and dummy description here..."
                            .text
                            .color(darkFontGrey)
                            .make(),
                        //buttons section
                        10.heightBox,
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                              itemDetailButtonsList.length,
                              (index) => ListTile(
                                    title: itemDetailButtonsList[index]
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    trailing: const Icon(Icons.arrow_forward),
                                  )),
                        ),
                        20.heightBox,
                        //product may like section
                         productsyoumaylike.text.fontFamily(fontBold).size(16).color(darkFontGrey).make(),
                         10.heightBox,


                         //copied this widget from home screen featured products
                         SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        10.heightBox,
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
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 5))
                                        .roundedSM
                                        .padding(const EdgeInsets.all(8))
                                        .make()),
                          ),
                        )
                      ],
                    ),
                  ))),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: myButton(
              color: bermudaGrey,
              onPress: () {},
              textColor: whiteColor,
              title: "Add to cart",
            ),
          )
        ],
      ),
    );
  }
}
