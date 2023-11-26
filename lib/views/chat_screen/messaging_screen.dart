import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/loading_indicator.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title:
            "My Messages".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getAllMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "No messages yet!".text.color(darkFontGrey).makeCentered();
            } else {
              return Column();
            }
          }),
    );
  }
}
