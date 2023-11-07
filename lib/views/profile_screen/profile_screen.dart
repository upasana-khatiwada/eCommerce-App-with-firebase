import 'package:ecommerce_app_with_firebase/common_widgets/bg_widget.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/profile_controller.dart';
import 'package:ecommerce_app_with_firebase/views/profile_screen/components/details_button.dart';
import 'package:ecommerce_app_with_firebase/views/profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //edit profile button
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                color: whiteColor,
              ),
            ).onTap(() {
              Get.to(() => EditProfileScreen());
            }),
          ),
          //users details section
          Row(
            children: [
              Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Dummy User".text.fontFamily(semibold).white.make(),
                  "dummyemail1234@gmail.com".text.white.make(),
                ],
              )),
              10.heightBox,
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                  color: whiteColor,
                )),
                onPressed: () {},
                child: logout.text.fontFamily(semibold).white.make(),
              )
            ],
          ),
          // 20.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    detailsCard(
                        width: context.screenWidth / 3.3,
                        count: "00",
                        title: "in your cart"),
                    5.widthBox,
                    detailsCard(
                        width: context.screenWidth / 3,
                        count: "32",
                        title: "in your wishlist"),
                    5.widthBox,
                    detailsCard(
                        width: context.screenWidth / 3.3,
                        count: "675",
                        title: "your orders"),
                  ],
                ),
              ),
            ),
          ),

          //buttons section

          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.asset(
                  profileButtonsIcon[index],
                  width: 22,
                  color: darkFontGrey,
                ),
                title: profileButtonsList[index]
                    .text
                    .fontFamily(semibold)
                    .color(darkFontGrey)
                    .make(),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: lightGrey,
                indent: 6,
              );
            },
            itemCount: profileButtonsList.length,
          )
              .box
              .white
              .rounded
              .margin(const EdgeInsets.all(12))
              .padding(const EdgeInsets.symmetric(horizontal: 12))
              .shadowSm
              .make()
              .box
              .color(bermudaGrey)
              .make(),
        ],
      )),
    ));
  }
}
