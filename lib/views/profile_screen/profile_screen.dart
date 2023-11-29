import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/bg_widget.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/auth_controller.dart';
import 'package:ecommerce_app_with_firebase/controllers/profile_controller.dart';
import 'package:ecommerce_app_with_firebase/services/firestore_services.dart';
import 'package:ecommerce_app_with_firebase/views/auth_screen/login_screen.dart';
import 'package:ecommerce_app_with_firebase/views/chat_screen/messaging_screen.dart';
import 'package:ecommerce_app_with_firebase/views/orders_screen/orders_screen.dart';
import 'package:ecommerce_app_with_firebase/views/profile_screen/components/details_button.dart';
import 'package:ecommerce_app_with_firebase/views/profile_screen/edit_profile_screen.dart';
import 'package:ecommerce_app_with_firebase/views/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    //FirestoreServices().getCounts();
    return bgWidget(
        child: Scaffold(
      //The snapshot in this context refers to the current state of the asynchronous stream of data that is being listened to.

      body: StreamBuilder(
          //he getUser function from FirestoreServices returns a stream of data from the Firestore collection where the 'id' is equal to the provided uid (user ID).
          stream: FirestoreServices.getUser(currentUser!.uid),
          //This is the builder function that gets called every time the stream emits new data
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // This checks if there is no data available in the snapshot. If there's no data, it displays a CircularProgressIndicator
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(bermudaGrey),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
              return SafeArea(
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
                      //so that it doesnot change on keyboard close on edit profilescreen
                      controller.nameController.text = data['name'];
                      Get.to(() => EditProfileScreen(data: data));
                    }),
                  ),
                  //users details section
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(imgProfile2,
                                    width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make()
                            : Image.network(data['imageUrl'],
                                    width: 100, fit: BoxFit.cover)
                                .box
                                .roundedFull
                                .clip(Clip.antiAlias)
                                .make(),
                        10.widthBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            "${data['email']}".text.white.make(),
                          ],
                        )),
                        10.heightBox,
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                            color: whiteColor,
                          )),
                          onPressed: () async {
                            await Get.put(AuthController())
                                .signoutMethod(context);
                            Get.offAll(() => const LoginScreen());
                          },
                          child: logout.text.fontFamily(semibold).white.make(),
                        )
                      ],
                    ),
                  ),
                  // 20.heightBox,
                  FutureBuilder(
                      future: FirestoreServices.getCounts(),
                      builder:
                          (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: loadingIndicator(),
                          );
                        } else {
                          var countData = snapshot.data;
                          return Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              detailsCard(
                                  width: context.screenWidth / 3.3,
                                  count: countData[0].toString(),
                                  title: "in your cart"),
                              detailsCard(
                                  width: context.screenWidth / 3,
                                  count: countData[1].toString(),
                                  title: "in your wishlist"),
                              detailsCard(
                                  width: context.screenWidth / 3.3,
                                  count: countData[2].toString(),
                                  title: "your orders"),
                            ],
                          );
                        }
                      }),

                  //buttons section

                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(() => const OrdersScreen());
                              break;
                            case 1:
                              Get.to(() => const WishlistScreen());
                              break;
                            case 2:
                              Get.to(() => const MessagesScreen());
                              break;
                          }
                        },
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
              ));
            }
          }),
    ));
  }
}
