//  import 'package:ecommerce_app_with_firebase/consts/colors.dart';
// import 'package:ecommerce_app_with_firebase/consts/images.dart';
//  import 'package:flutter/material.dart';

// // Widget bgWiidget({required Scaffold child}) {
// //   return SingleChildScrollView(
// //     child: Column(
// //       children: [
// //         Container(        decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(8)),
// //   ),
  
// //         Container(
// //           // decoration: BoxDecoration(
// //           //     image: DecorationImage(
// //           //   image: AssetImage(imgBackground),
// //           //   fit: BoxFit.fill,
// //           // ),),
// //           // child: child,
  
// //           // child: Column(
// //           //   children: [
// //           //     Row(
// //           //       children: [
// //           //         Container(
// //           //           color: Colors.blue,
// //           //         )
// //           //       ],
// //           //     ),
// //           //     Row(
// //           //       children: [
// //           //         Container(
// //           //           color: Colors.pink,
// //           //         )
// //           //       ],
// //           //     ),
// //           //   ],
// //           // ),
  
// //           decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
// //           child: child,
// //         ),
// //       ],
// //     ),
// //   );
// // }


// Widget bgWiidget(){
//   return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//             color: bermudaGrey,
//             height: MediaQuery.of(context).size.height*0.25,
//             child: Center(
              
//             ),
//           )),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//              color: Colors.white,
//               height: MediaQuery.of(context).size.height *0.75, // Set the height for the bottom section
//               child: Center(

//                 // Place your content widget for the bottom section here
//               ),
//           ))
//         ],
//       ),
//     );

// }



//sign up screen
// Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     color: Colors.white,
          //     height: context.screenHeight * 0.65,
          //     child: Center(
          //       child: Column(
          //         children: [
          //           customTextField(hint: nameHint, title: name, isPass: false),
          //           customTextField(
          //               hint: emailHint, title: email, isPass: false),
          //           customTextField(
          //               hint: passwordHint, title: password, isPass: true),
          //           customTextField(
          //               hint: passwordHint,
          //               title: retypePassword,
          //               isPass: true),
          //           Align(
          //             alignment: Alignment.centerRight,
          //             child: TextButton(
          //               onPressed: () {},
          //               child: forgetPassword.text.make(),
          //             ),
          //           ),
          //         ],
          //       )
          //           .box
          //           .white
          //           .rounded
          //           .padding(const EdgeInsets.all(16))
          //           .width(context.screenWidth - 70)
          //           .shadowSm
          //           .make(),
          //     ),
          //   ),
          // ),