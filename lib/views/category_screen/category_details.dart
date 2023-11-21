import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/bg_widget.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/product_controller.dart';
import 'package:ecommerce_app_with_firebase/services/firestore_services.dart';
import 'package:ecommerce_app_with_firebase/views/category_screen/items_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetails extends StatefulWidget {
  final String? title;

  const CategoryDetails({
    super.key,
    required this.title,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchCategory(widget.title);
  }

  switchCategory(title) {
    if (controller.subcat.contains(title)) {
      // productMethod = FirestoreServices.getSubCategoryProducts(title);
    } else {
      productMethod = FirestoreServices.getProducts(title);
    }
  }

  var controller = Get.find<ProductController>();

  dynamic productMethod;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              title: widget.title!.text.fontFamily(fontBold).white.make(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                        controller.subcat.length,
                        (index) => "${controller.subcat[index]}"
                                .text
                                .size(12)
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .makeCentered()
                                .box
                                .white
                                .roundedSM
                                .size(120, 60)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .make()
                                .onTap(() {
                              switchCategory("${controller.subcat[index]}");
                              setState(() {});
                            })),
                  ),
                ),
                20.heightBox,
                StreamBuilder(
                  stream: productMethod, //FirestoreServices.getProducts(title),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        child: Center(
                          child: loadingIndicator(),
                        ),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: "No products found!"
                            .text
                            .color(darkFontGrey)
                            .makeCentered(),
                      );
                    } else {
                      var data = snapshot.data!.docs;

                      return Expanded(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 250,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                // Check if the fields exist before trying to access them
                                var docData =
                                    data[index].data() as Map<String, dynamic>;
                                // var imgUrl = docData.containsKey('p_imgs')
                                //     ? docData['p_imgs'][0]
                                //     : 'default_img_url';
                                // var productName = docData.containsKey('p_name')
                                //     ? docData['p_name']
                                //     : 'default_name';
                                // var productPrice =
                                //     docData.containsKey('p_price')
                                //         ? docData['p_price'].toString()
                                //         : 'default_price';

                                var productPrice = docData['p_price'];

// Check if productPrice is null or not present
                                if (productPrice == null) {
                                 // print('Warning: p_price is null.');
                                  productPrice = 'default_price';
                                } else {
                                  productPrice = productPrice.toString();
                                }
                                // print(Colors.white70.value);
                                //for debugging if necessary print
                                // print("final productPrice: $productPrice");
                                // print(
                                //     "docData['p_price'] runtime type: ${docData['p_price'].runtimeType}");

                                // if (productPrice == 'default_price') {
                                //   print(
                                //       'Warning: p_price is not present or is null.');
                                // }

                                // print("productName: $productName");
                                // print("productPrice: $productPrice");
                                //  print("docData: $docData");

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      // imgUrl,
                                      data[index]['p_imgs'][0],
                                      height: 150,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    // Image.asset(imgP5,height: 160,width: 200,fit: BoxFit.cover,).box.roundedSM.clip(Clip.antiAlias).make(),
                                    5.heightBox, //.box.roundedSM.clip(Clip.antiAlias).make(),
                                    // "${data[index]['p_name']}"
                                    Text(
                                      "${data[index]['p_name']}",

                                      // productName,
                                      style: const TextStyle(
                                          fontFamily: semibold,
                                          color: darkFontGrey),
                                    ),
                                    10.heightBox,
                                    // "${data[index]['p_price']}"
                                    // productPrice.numCurrency.text
                                    //     .color(redColor)
                                    //     .fontFamily(fontBold)
                                    //     .size(16)
                                    //     .make(),
                                    Text(
                                      productPrice,
                                      style: const TextStyle(
                                          color: bermudaGrey,
                                          fontFamily: fontBold,
                                          fontSize: 16),
                                    ),

                                    10.heightBox,
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .roundedSM
                                    .outerShadowSm
                                    .padding(const EdgeInsets.all(12))
                                    .color(whiteColor)
                                    .make()
                                    .onTap(() {
                                   controller.checkIfFav(data[index]);
                                  Get.to(() => ItemDetails(
                                      title: "${data[index]['p_name']}",
                                      data: data[index]));
                                });
                              }));
                    }
                  },
                ),
              ],
            )));
  }
}
