import 'package:ecommerce_app_with_firebase/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shopping Sathi",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent,),
        fontFamily: "sans_regular",
      ),
      home: const SplashScreen(),
    );
  }
}