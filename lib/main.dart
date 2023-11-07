import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:127666465851:android:e8aeda543c6206af95001e',
      apiKey: 'AIzaSyBmKh964zbsKxyCPgHqaL2Cub3Eu7kFmxU',
      messagingSenderId: '127666465851',
      projectId: 'ecommerce-a8996',
      storageBucket: 'ecommerce-a8996.appspot.com',
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //we are using getx so we have to change this material app into getMaterialApp

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          //to save app bar icons every color to darkFontGrey by default
          iconTheme: IconThemeData(color: darkFontGrey),
          backgroundColor: Colors.transparent,
        ),
        fontFamily: "sans_regular",
      ),
      home: const SplashScreen(),
    );
  }
}
