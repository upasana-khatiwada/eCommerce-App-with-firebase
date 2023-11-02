import 'package:ecommerce_app_with_firebase/common_widgets/home_buttons.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/views/home_screen/featured_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          //search bar
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.search).onTap(() {}),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchHere,
                  hintStyle: const TextStyle(color: textfieldGrey)),
            ),
          ),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //swipers brands
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: slidersList.length,
                    itemBuilder: ((context, index) {
                      return Image.asset(
                        slidersList[index], fit: BoxFit.fill,
                        //clip.antiAlies makes the box rounded
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    }),
                  ),
                  10.heightBox,
                  //deals button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButton(
                              width: context.screenWidth / 2.5,
                              height: context.screenHeight * 0.15,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? todayDeal : flashsale,
                              onPress: () {},
                            )),
                  ),

                  10.heightBox,
                  //second Swiper
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: secondslidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondslidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),
                  10.heightBox,

                  //top categories brands selelrs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButton(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 3.5,
                              icon: index == 0
                                  ? icTopCategories
                                  : index == 1
                                      ? icBrands
                                      : icTopSeller,
                              title: index == 0
                                  ? topcategories
                                  : index == 1
                                      ? brand
                                      : topsellers,
                            )),
                  ),
                  20.heightBox,
                  //featured categories

                  Align(
                    alignment: Alignment.centerLeft,
                    child: featuredCategories.text
                        .color(darkFontGrey)
                        .size(18)
                        .fontFamily(semibold)
                        .make(),
                  ),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          3,
                          (index) => Column(
                                children: [
                                  featuredButton(
                                      icon: featuredImages1[index],
                                      title: featuredTitles1[index]),
                                  10.heightBox,
                                  featuredButton(
                                      icon: featuredImages2[index],
                                      title: featuredTitles2[index]),
                                ],
                              )).toList(),
                    ),
                  ),

                  //feature product
                  20.heightBox,
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: bermudaGrey,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text.white
                            .fontFamily(fontBold)
                            .size(18)
                            .make(),
                        10.heightBox,
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
                  ),
                  //third swiper
                  20.heightBox,
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      itemCount: secondslidersList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondslidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),

                  //all products section
                  20.heightBox,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP5,
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
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
                            .padding(const EdgeInsets.all(12))
                            .make();
                      })
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
