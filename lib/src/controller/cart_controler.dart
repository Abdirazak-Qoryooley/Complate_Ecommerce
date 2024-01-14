import 'package:complete_ecommerce/src/models/model.dart';
import 'package:get/get.dart';

class cartcontroller extends GetxController {
  var cartitems = <product>[].obs;

  int get count => cartitems.length;
  double get totalprice => cartitems.fold(0, (sum, items) => sum + items.price);

  RemoveToCart(int index) {
    cartitems.removeAt(index);
  }

  AddToCart(product Product) {
    cartitems.add(Product);
  }

  RxInt counter = 0.obs;
  void increament() {
    counter++;
    update();
  }

  void decreament() {
    if (counter.value > 0) {
      counter.value--;
    }
  }


  }

