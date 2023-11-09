
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(bermudaGrey),
  );
}