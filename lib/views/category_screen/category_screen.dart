import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/product_controller.dart';
import 'package:ecommerce_app_with_firebase/views/category_screen/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

     var controller = Get.put(ProductController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: bermudaGrey,
              height: context.screenHeight * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: categories.text.white.fontFamily(fontBold).size(22).make()),
                  ],
                ),
              ),
              
            ),
          ),
          Positioned(
            top: context.screenHeight * 0.15,
            left: context.screenWidth * 0.02,
            right: context.screenWidth * 0.02,
            child: SingleChildScrollView(
              child: Container(
                height: context.screenHeight * 0.8, // Adjust this value as needed
                color: Colors.transparent,
                // height: 50,
                child: Center(
                  child: Container(
                     padding: const EdgeInsets.all(12),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                       itemCount: 9,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                             mainAxisExtent: 200,
                            ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.asset(
                                categoriesImages[index],
                                height: 120,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              categoreisList[index]
                                  .text
                                  .color(darkFontGrey)
                                  .align(TextAlign.center)
                                  .make()
                            ],
                          ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() { 
                            controller.getSubCategories(categoreisList[index]);
                           Get.to(()=> CategoryDetails(title: categoreisList[index]));
                          });
                        }).box
                               .transparent
                                .roundedSM
                                .padding(const EdgeInsets.all(2))
                                .width(context.screenWidth - 30)
                                 
                                 .make(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}









// // import 'package:ecommerce_app_with_firebase/consts/colors.dart';
// // import 'package:ecommerce_app_with_firebase/consts/lists.dart';
// // import 'package:ecommerce_app_with_firebase/consts/strings.dart';
// // import 'package:flutter/material.dart';
// // import 'package:velocity_x/velocity_x.dart';

// // class CategoryScreen extends StatelessWidget {
// //   const CategoryScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: false,
// //       body: Expanded(
// //         child: SingleChildScrollView(
// //           child: Stack(
// //             children: [
// //               Positioned(
// //                   top: 0,
// //                   left: 0,
// //                   right: 0,
// //                   child: Container(
// //                     color: bermudaGrey,
// //                     height: context.screenHeight * 0.5,
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: Column(
// //                         //mainAxisAlignment: MainAxisAlignment.center,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           50.heightBox,
// //                           Align(
// //                             alignment: Alignment.centerLeft,
// //                             child: categories.text.fontFamily(fontBold).white.size(22).make()),
// //                         ]

// //                       ),
// //                     ),
// //                   ),
// //                   ),
// //               Positioned(
// //                   bottom: 0,
// //                   left: 0,
// //                   right: 0,
// //                   child: Container(
// //                     height: context.screenHeight * 0.65,
// //                     color: whiteColor,
// //                   )),
// //               Positioned.fill(
// //                   top: context.screenHeight * 0.2,
// //                   child: SingleChildScrollView(
// //                     child: Container(
// //                       // color: Colors.transparent,
// //                       color: Colors.transparent,
// //                       child: Center(
// //                         child: Column(
// //                           children: [
// //                             Container(
// //                               padding: const EdgeInsets.all(12),
// //                               child: GridView.builder(
// //                                   shrinkWrap: true,
// //                                   itemCount: 9,
// //                                   gridDelegate:
// //                                       const SliverGridDelegateWithFixedCrossAxisCount(
// //                                           crossAxisCount: 3,
// //                                           mainAxisSpacing: 8,
// //                                           crossAxisSpacing: 8,
// //                                           mainAxisExtent: 200),
// //                                   itemBuilder: (context, index) {
// //                                     return Column(
// //                                       children: [
// //                                         Image.asset(
// //                                           categoriesImages[index],
// //                                           height: 120,
// //                                           width: 200,
// //                                           fit: BoxFit.cover,
// //                                         ),
// //                                         10.heightBox,
// //                                         categoreisList[index]
// //                                             .text
// //                                             .color(darkFontGrey)
// //                                             .align(TextAlign.center)
// //                                             .make()
// //                                       ],
// //                                     ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make();
// //                                   }),
// //                             )
// //                           ],
// //                         )
// //                             .box
// //                             .white
// //                             .rounded
// //                             .padding(const EdgeInsets.all(16))
// //                             .width(context.screenWidth - 70)
// //                             .shadowSm
// //                             .make(),
// //                       ),
// //                     ),
// //                   ))
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }