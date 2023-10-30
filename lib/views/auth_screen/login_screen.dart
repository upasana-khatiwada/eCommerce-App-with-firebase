import 'package:ecommerce_app_with_firebase/common_widgets/app_logo.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/bg_widget.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/images.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: bermudaGrey,
          floating: true,
          //pinned: true,
          //snap: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.25,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(children: [
              Center(child: appLogoWidget()),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  //height: MediaQuery.of(context).size.height * 0.75,

                  child: "Log in to $appname"
                      .text
                      .fontFamily("sans_bold")
                      .white
                      .size(22)
                      .make(),
                ),
              )
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: whiteColor,
            height: MediaQuery.of(context).size.height*0.75,
          ),
        )
      ],
    );
  }
}
