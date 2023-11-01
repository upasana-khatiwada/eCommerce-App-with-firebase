import 'package:ecommerce_app_with_firebase/common_widgets/app_logo.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/custom_text_fields.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/lists.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:ecommerce_app_with_firebase/views/auth_screen/signup_screen.dart';
import 'package:ecommerce_app_with_firebase/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          //above section of logo
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
                          .fontFamily(fontBold)
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
          //below content section
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
                        //email and password feild
                        customTextField(
                            hint: emailHint, title: email, isPass: false),
                        customTextField(
                            hint: passwordHint, title: password, isPass: true),

                        //forget password
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: forgetPassword.text.make()),
                        ),
                        5.heightBox,
                        // myButton().box.width(context.screenWidth -50).make(),
                        //login button
                        myButton(
                          onPress: () {
                            Get.to(()=> const Home());
                          },
                          color: bermudaGrey,
                          textColor: whiteColor,
                          title: login,
                        ).box.width(context.screenWidth - 50).make(),
                        5.heightBox,
                        //text for create new account
                        createNewAccount.text.color(fontGrey).make(),
                        5.heightBox,
                        //sign up button
                        myButton(
                          onPress: () {
                            //to go to the signup page we are using getX
                            Get.to(() => const SignUpScreen());
                          },
                          color: royalBlue,
                          textColor: bermudaGrey,
                          title: signup,
                        ).box.width(context.screenWidth - 50).make(),
                        10.heightBox,
                        //login with text
                        loginWith.text.color(fontGrey).make(),
                        5.heightBox,
                        //to display three icons facebook,google,twitter
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor: lightGrey,
                                        radius: 25,
                                        child: Image.asset(
                                          socialIconList[index],
                                          width: 30,
                                        ),
                                      ),
                                    )))
                      ])
                          .box
                          .color(const Color.fromARGB(255, 244, 244, 244))
                          .rounded
                          .padding(const EdgeInsets.all(16))
                          .width(context.screenWidth - 70)
                          .shadowSm
                          .make(),
                    )
                  ],
                )
                ),
          )
        ],
      ),
    );
  }
}


//,controller: controller.emailController
//, controller: passwordController