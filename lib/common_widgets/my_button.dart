import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget myButton(  {
  onPress,color,textColor,String? title
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      // primary: color,
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    
    child: title!.text.color(textColor).fontFamily(fontBold).make(),
  );
}
