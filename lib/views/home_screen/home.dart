import 'package:ecommerce_app_with_firebase/common_widgets/exit_dialog.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/controllers/home_controller.dart';
import 'package:ecommerce_app_with_firebase/views/cart_screen/cart_screen.dart';
import 'package:ecommerce_app_with_firebase/views/category_screen/category_screen.dart';
import 'package:ecommerce_app_with_firebase/views/home_screen/home_screen.dart';
import 'package:ecommerce_app_with_firebase/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    //willpopscope is used so that when we press the back botton the it asks if we want to exit our application
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        
        //to show the content as selected index
        body: Column(
          children: [
            Obx(() => Expanded(
                  child: navBody.elementAt(controller.currentNavIndex.value),
                )),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: bermudaGrey,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
