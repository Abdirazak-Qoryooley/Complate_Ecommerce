// // ignore_for_file: must_be_immutable

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:complete_ecommerce/src/controller/product.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CarouselDemo extends StatelessWidget {
//   CarouselController buttonCarouselController = CarouselController();
//   final productcontroller controller = Get.put(productcontroller());

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         CarouselSlider(
//           items: controller.products.map((product) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                   margin: const EdgeInsets.all(6.0),
//                   child: InkWell(
//                     onTap: () {
//                       // Handle product tap
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
                       
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: IconButton(
//                               icon: Icon(
//                                 product.isSelected
//                                     ? Icons.favorite
//                                     : Icons.favorite_border,
//                                 color: Colors.red,
//                               ),
//                               onPressed: () {
//                                 // Toggle product selection
//                                 controller.toggleProductSelection(product);
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 5),
//                           Image.asset(
//                             product.image!,
//                             height: 150,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 8.0,
//                             ),
//                             child: Text(
//                               product.name!,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 8.0,
//                                 ),
//                                 child: Text(
//                                   '\$${product.price.toStringAsFixed(2)}',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               const Spacer(),
//                               IconButton(
//                                 onPressed: () {
//                                   // Handle add to cart
//                                 },
//                                 icon: const Icon(Icons.add_shopping_cart),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//           carouselController: buttonCarouselController,
      
//         ),
//       ],
//     );
//   }
// }