import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
import 'package:ecommerce_app_with_firebase/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0.obs;
  late dynamic productSnapshot;

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }
  // text controllers for shipping details

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalController = TextEditingController();
  var phoneController = TextEditingController();

  var paymentIndex = 0.obs;
  var products = [];
  var vendors = []; //

  var placingOrder = false.obs;

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    placingOrder(true);
//first we get the product details before adding the orderscollection in the firestore
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': "1234562",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'order_by_postalcode': postalController.text,
      'shipping_method': "Home Delivery",
      'payment_method': orderPaymentMethod,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'order_placed': true,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products),
      //'vendors': FieldValue.arrayUnion([vendors]),
    });
    placingOrder(false);
  }

  //since every whislist has different id and its diffult to map every item in a single order list so we are going to map it as
  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'img': productSnapshot[i]['img'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'tprice': productSnapshot[i]['tprice'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title'],
      });
    }
  }

  clearCart() {
    for (var i = 0; i < productSnapshot.length; i++) {
      firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
  }
}
