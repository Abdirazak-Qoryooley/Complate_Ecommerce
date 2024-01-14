import 'package:complete_ecommerce/src/views/screens/cartpage.dart';
import 'package:complete_ecommerce/src/views/screens/favorite.dart';
import 'package:complete_ecommerce/src/views/screens/home.dart';
import 'package:complete_ecommerce/src/views/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  final List<Widget> pages = [
    homescreen(),
    cartpage(),
    FavoritePage(),
    profilescreen(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
