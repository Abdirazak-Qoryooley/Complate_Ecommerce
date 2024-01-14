// ignore_for_file: unused_local_variable

import 'package:complete_ecommerce/src/controller/Favorite.dart';
import 'package:complete_ecommerce/src/controller/cart_controler.dart';
import 'package:complete_ecommerce/src/controller/product.dart';
import 'package:complete_ecommerce/src/views/screens/product_deteil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class product_card extends StatelessWidget {
  product_card({
    super.key,
    required this.controller,
  });

  final productcontroller controller;
  final productcontroller controller1 = Get.put(productcontroller());
  final cartcontroller controller2 = Get.put(cartcontroller());

  final FavoriteController controllerf = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return GetX<productcontroller>(builder: (controller) {
      return GridView.builder(
        itemCount: controller.products.length,
        physics: AlwaysScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.68,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            mainAxisExtent: 300),
        itemBuilder: (context, index) {
          final Product = controller.products[index];
          return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        offset: Offset(1, 10),
                        color: Colors.white,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 2),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(
                      () => IconButton(
                        icon: Icon(
                          controllerf.isFavorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              controllerf.isFavorite.value ? Colors.red : null,
                        ),
                        onPressed: () {
                          controllerf.toggleFavorite();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => productdeteil(
                              Product: Product,
                            ),
                          ),
                        );
                      },
                      child: Image.asset(controller.products[index].image!)),
                  Text(
                    controller.products[index].name!,
                    style: GoogleFonts.laila(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("\$${controller.products[index].price.toString()}"),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          controller2.AddToCart(Product);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            IconlyLight.plus,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
