// ignore_for_file: unused_import

import 'package:complete_ecommerce/src/constants.dart';
import 'package:complete_ecommerce/src/controller/cart_controler.dart';
import 'package:complete_ecommerce/src/controller/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_fonts/google_fonts.dart';

class cartpage extends StatelessWidget {
  cartpage({super.key});

  final cartcontroller controller2 = Get.put(cartcontroller());
  final productcontroller controller = Get.put(productcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(child: Text('My Carts')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: Obx(() => Text(controller2.count.toString())),
                child: Icon(IconlyLight.bag),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Obx(() {
                if (controller2.cartitems.isEmpty) {
                  return Center(
                    child: Text(
                      'cart is empty',
                      style: theme.kBigtitle,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller2.cartitems.length,
                  itemBuilder: (context, index) {
                    final cartitems = controller2.cartitems[index];
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Image.asset(
                          cartitems.image!,
                        ),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          controller2.RemoveToCart(index);
                        },
                        child: Icon(IconlyLight.delete),
                      ),
                      title: Text(
                        controller2.cartitems[index].name!,
                        style: GoogleFonts.laila(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text(controller2.cartitems[index].price.toString()),
                    );
                  },
                );
              }),
            ),
            Divider(
              color: Colors.grey,
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Have a coupon code? enter here',
                        style: theme.kbodytext.copyWith(color: Colors.black45),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'FDS203',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Available',
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GetX<cartcontroller>(builder: (controller) {
                      return ListTile(
                        leading: Text('TOTAL:',
                            style: TextStyle(
                              fontSize: 25,
                            )),
                        trailing: Text(
                          '\$${controller2.totalprice.toString()}',
                          style: TextStyle(fontSize: 25),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            maximumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.purple),
                        child: Text(
                          'Continue to Checkout',
                          style: GoogleFonts.sourceSans3(fontSize: 20),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
