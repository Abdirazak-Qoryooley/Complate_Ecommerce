// ignore_for_file: unused_import

import 'package:complete_ecommerce/src/constants.dart';
import 'package:complete_ecommerce/src/controller/home.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class home extends StatelessWidget {
  final List<IconData> icons = [
    IconlyLight.home,
    IconlyLight.bag,
    IconlyLight.heart,
    IconlyLight.profile
  ];

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          backgroundColor: Colors.black,
          selectedItemColor: kPrimaryColor,
          onTap: (index) => controller.changePage(index),
          items: List.generate(
            icons.length,
            (index) => BottomNavigationBarItem(
                backgroundColor: Colors.purple,
                icon: Icon(
                  icons[index],
                ),
                label: ''),
          ),
        ),
      ),
    );
  }
}
