import 'package:ecommerce_app_with_firebase/common_widgets/app_logo.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/views/auth_screen/login_screen.dart';
import 'package:ecommerce_app_with_firebase/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creatinng a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //using getX
      //if we are logged in go to home otherwise go to loginscreen
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        }else{
          Get.to(()=> const Home());
        }
      });
    });
  }

  //to start or execute
  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bermudaGrey,
      body: Center(
        child: Column(children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              )),
          20.heightBox,
          appLogoWidget(),
          10.heightBox,
          const Text(
            appname,
            style: TextStyle(
              fontFamily: "sans_bold",
              fontSize: 22,
              color: whiteColor,
            ),
          ),
          //or can be written as for text as making it shortcut using velocity_x package
          //appname.text.fontFamily(bold).size(22).white.make(),

          5.heightBox,
          appversion.text.white.make(),
          const Spacer(),
          const Text(
            'made by : Upasana',
            style: TextStyle(color: whiteColor, fontFamily: 'sans_semibold'),
          ),
          30.heightBox,
        ]),
      ),
    );
  }
}
