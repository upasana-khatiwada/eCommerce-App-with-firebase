import 'package:ecommerce_app_with_firebase/common_widgets/app_logo.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/custom_text_fields.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: bermudaGrey,
            floating: true,
            //pinned: true,
            //snap: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
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
                  ),
                  50.heightBox,
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                color: whiteColor,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  children: [
                    30.heightBox,

                    //(context.screenHeight*0.1).heightBox;
                    Container(
                      child: Column(children: [
                        customTextField(hint: emailHint,title: email,isPass: false),
                        customTextField(hint: passwordHint, title : password,isPass: true),
                      ])
                          .box
                          .color(const Color.fromARGB(255, 244, 244, 244))
                          .rounded
                          .padding(const EdgeInsets.all(16))
                          .width(context.screenWidth - 70)
                          .make(),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}


//,controller: controller.emailController
//, controller: passwordController