// ignore_for_file: unused_import

import 'package:complete_ecommerce/src/constants.dart';
import 'package:complete_ecommerce/src/controller/cart_controler.dart';
import 'package:complete_ecommerce/src/models/model.dart';
import 'package:complete_ecommerce/src/views/screens/cartpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class productdeteil extends StatelessWidget {
  productdeteil({super.key, required this.Product});
  final product Product;
  final cartcontroller controller2 = Get.put(cartcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(cartpage());
            },
            icon: badges.Badge(
              badgeContent: Obx(() => Text(controller2.count.toString())),
              child: Icon(IconlyLight.bag),
            ),
          ),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 5,
          child: Container(
            width: 400,
            height: 280,
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              image: DecorationImage(
                image: AssetImage(Product.image!),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Product.name!,
                  style: theme.kBigtitle,
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('123 reviews')
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  Product.desc!,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${Product.price.toString()}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      child: Row(
                        children: [],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        controller2.AddToCart(Product);
                      },
                      style: ElevatedButton.styleFrom(
                          maximumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.purple),
                      child: Text('Add item to bag',
                          style: GoogleFonts.sourceSans3(fontSize: 20,color: Colors.white))),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
