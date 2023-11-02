import 'package:ecommerce_app_with_firebase/common_widgets/app_logo.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/custom_text_fields.dart';
import 'package:ecommerce_app_with_firebase/common_widgets/my_button.dart';
import 'package:ecommerce_app_with_firebase/consts/colors.dart';
import 'package:ecommerce_app_with_firebase/consts/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: bermudaGrey,
                  height: context.screenHeight * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: appLogoWidget()),
                        // appname.text.white.fontFamily(fontBold).size(22).make(),
                        10.heightBox,
                        "Join the $appname"
                            .text
                            .fontFamily(fontBold)
                            .white
                            .size(18)
                            .make(),
                        15.heightBox,
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: context.screenHeight * 0.65,
                  color: whiteColor,
                )),
            Positioned.fill(
              top: context.screenHeight * 0.25,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Column(
                      children: [
                        customTextField(hint: nameHint, title: name, isPass: false),
                        customTextField(
                            hint: emailHint, title: email, isPass: false),
                        customTextField(
                            hint: passwordHint, title: password, isPass: true),
                        customTextField(
                            hint: passwordHint,
                            title: retypePassword,
                            isPass: true),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: forgetPassword.text.make(),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: bermudaGrey,
                              checkColor: whiteColor,
                                value: isCheck,
                                onChanged: (newValue) {
                                  setState(() {
                                    isCheck = newValue;
                                  });
                                },
                                ),
                                10.heightBox,
                                Expanded(
                              child: RichText(
                                  text: const TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "I agree to the ",
                                            style: TextStyle(
                                              fontFamily: regular,
                                              color: fontGrey,
                                            )),
                                        TextSpan(
                                            text: termAndCond,
                                            style: TextStyle(
                                              fontFamily: fontBold,
                                              color: bermudaGrey,
                                            )),
                                        TextSpan(
                                            text: " & ",
                                            style: TextStyle(
                                              fontFamily: regular,
                                              color: fontGrey,
                                            )),
                                        TextSpan(
                                            text: privacyPolicy,
                                            style: TextStyle(
                                              fontFamily: fontBold,
                                              color: bermudaGrey,
                                            )),
                                      ]
                                  )),
                            ),
              
              
                          ],
                        ),
                        5.heightBox,
                        myButton(
                              onPress: () {},
                              //we can click signup button only if the user has check the terms and conditions
      
                              color: isCheck == true ? bermudaGrey : lightGrey,
                              textColor: whiteColor,
                              title: signup,
                            ).box.width(context.screenWidth - 50).make(),
                            10.heightBox,
                             Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          alreadyHaveAccount.text.color(fontGrey).make(),
                          login.text.color(bermudaGrey).make().onTap(() {
                            Get.back();
                          }),
                        ],
                      ),
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .padding(const EdgeInsets.all(16))
                        .width(context.screenWidth - 70)
                        .shadowSm
                        .make(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
