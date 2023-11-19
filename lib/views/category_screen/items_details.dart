import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async{
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              //to refresh the previously selected items
              controller.resetValues();
              Get.back();
            },
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
                              itemCount: data['p_imgs'].length,
                              autoPlay: true,
                              height: 350,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1.0,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  data['p_imgs'][index],
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
                            value: double.parse(data['p_ratings']),
                            onRatingUpdate: (value) {},
                            normalColor: textfieldGrey,
                            selectionColor: golden,
                            count: 5,
                            size: 25,
                            maxRating: 5,
                          ),
                          10.heightBox,
                          "${data['p_price']}"
                              .numCurrency
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
                                  "${data['p_seller']}"
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
                          Obx(
                            () => Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: "Color: "
                                          .text
                                          .color(darkFontGrey)
                                          .make(),
                                    ),
                                    Row(
                                      children: List.generate(
                                          data['p_colors'].length,
                                          (index) => Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  VxBox()
                                                      .size(40, 40)
                                                      .roundedFull
                                                      .color(Color(int.parse(
                                                              data['p_colors']
                                                                  [index]))
                                                          .withOpacity(1.0))
                                                      .margin(const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 4))
                                                      .make()
                                                      .onTap(() {
                                                    controller
                                                        .changeColorIndex(index);
                                                  }),
                                                  Visibility(
                                                      visible: index ==
                                                          controller
                                                              .colorIndex.value,
                                                      child: const Icon(
                                                        Icons.done,
                                                        color: Colors.white,
                                                      ))
                                                ],
                                              )),
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
                                          .color(darkFontGrey)
                                          .make(),
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                controller.decreaseQuantity();
                                                controller.calculateTotalPrice(
                                                    int.parse(data['p_price']));
                                              },
                                              icon: const Icon(Icons.remove)),
                                          controller.quantity.value.text
                                              .size(16)
                                              .color(darkFontGrey)
                                              .fontFamily(fontBold)
                                              .make(),
                                          IconButton(
                                              onPressed: () {
                                                controller.increaseQuantity(
                                                    int.parse(
                                                        data['p_quantity']));
                                                controller.calculateTotalPrice(
                                                    int.parse(data['p_price']));
                                                //controller.increaseQuantity();
                                              },
                                              icon: const Icon(Icons.add)),
                                          10.widthBox,
                                          "(${data['p_quantity']} available)"
                                              .text
                                              .color(textfieldGrey)
                                              .make(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).box.padding(const EdgeInsets.all(8)).make(),
                                //total row
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: "Total:"
                                          .text
                                          .color(darkFontGrey)
                                          .make(),
                                    ),
                                    "${controller.totalPrice.value}"
                                        .numCurrency
                                        .text
                                        .color(bermudaGrey)
                                        .size(16)
                                        .fontFamily(fontBold)
                                        .make(),
                                  ],
                                ).box.padding(const EdgeInsets.all(8)).make(),
                              ],
                            ).box.white.shadowSm.make(),
                          ),
    
                          //description section
                          10.heightBox,
                          "Description"
                              .text
                              .color(darkFontGrey)
                              .fontFamily(semibold)
                              .make(),
                          10.heightBox,
                          "${data['p_desc']}".text.color(darkFontGrey).make(),
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
                          productsyoumaylike.text
                              .fontFamily(fontBold)
                              .size(16)
                              .color(darkFontGrey)
                              .make(),
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
                onPress: () {
                  controller.addToCart(
                      color: data['p_colors'][controller.colorIndex.value],
                      context: context,
                      vendorID: data['vendor_id'],
                      img: data['p_imgs'][0],
                      qty: controller.quantity.value,
                      sellername: data['p_seller'],
                      title: data['p_name'],
                      tprice: controller.totalPrice.value);
                  VxToast.show(context, msg: "Added to cart");
                },
                textColor: whiteColor,
                title: "Add to cart",
              ),
            )
          ],
        ),
      ),
    );
  }
}
