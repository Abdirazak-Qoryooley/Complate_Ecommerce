// ignore_for_file: unused_local_variable, unused_import

import 'package:complete_ecommerce/src/components/banner.dart';
import 'package:complete_ecommerce/src/components/drawer.dart';
import 'package:complete_ecommerce/src/components/product_card.dart';
import 'package:complete_ecommerce/src/controller/cart_controler.dart';
import 'package:complete_ecommerce/src/controller/product.dart';
import 'package:complete_ecommerce/src/views/screens/cartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;

class homescreen extends StatelessWidget {
  homescreen();

  final productcontroller controller = Get.put(productcontroller());
  final cartcontroller controller2 = Get.put(cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              onPressed: () {
                Get.to(cartpage());
              },
              icon: badges.Badge(
                badgeContent: Obx(() => Text(controller2.count.toString())),
                child: Icon(IconlyLight.bag),
              ),
            ),
          )
        ],
      ),
      drawer: drawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            banner_card(),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(child: product_card(controller: controller)),
          ],
        ),
      ),
    );
  }
}
