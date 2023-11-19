import 'package:ecommerce_app_with_firebase/consts/firebase_consts.dart';
import 'package:ecommerce_app_with_firebase/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;
   var totalPrice = 0.obs;

  var subcat = [];

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }
   calculateTotalPrice(price){
    totalPrice.value = price * quantity.value;
  }

   addToCart({title, img, sellername, color, qty, tprice, context, vendorID}) async{
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      'qty': qty,
      'vendor_id': vendorID,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
  }
}
