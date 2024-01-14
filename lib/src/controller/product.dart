import 'package:complete_ecommerce/src/models/model.dart';
import 'package:get/get.dart';

class productcontroller extends GetxController {
  var products = <product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchproducts();
  }

  void fetchproducts() async {
    await Future.delayed(Duration(seconds: 1));

    // ignore: unused_local_variable
    var productlist = [
      product(
          name: 'airpods Max',
          price: 200.99,
          image: 'image/airpods.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
      product(
          name: 'macbook',
          price: 2867,
          image: 'image/macbook.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
      product(
          name: 'magic',
          price: 19999,
          image: 'image/magic.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
      product(
          name: 'pixel7',
          price: 200,
          image: 'image/pixel7.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
      product(
          name: 'watch',
          price: 300,
          image: 'image/watch.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
      product(
          name: 'yoga',
          price: 1399,
          image: 'image/yoga.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
      product(
          name: 'zfold',
          price: 500.45,
          image: 'image/zfold.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
      product(
          name: 'Apple iPad Pro',
          price: 1000,
          image: 'image/ipad.jpg',
          desc:
              'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups. Lorem Ipsum Generator.',
          isSelected: false),
    ];
    products.value = productlist;
  }

  List<String> temfruitlist = <String>[].obs;
  Addtofovarite(String value) {
    temfruitlist.add(value);
  }

  removefovarite(String value) {
    temfruitlist.remove(value);
  }
}
