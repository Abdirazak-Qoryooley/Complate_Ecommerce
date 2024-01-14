import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final favoritecontroller productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      // body: Obx(
      //   () => ListView.builder(
      //     itemCount: favoriteController.isFavoriteList.length,
      //     itemBuilder: (context, index) {
      //       final item = favoriteController.isFavoriteList[index];
      //       return ListTile(
      //         title: Text('Favorite Item $item'),
      //         trailing: IconButton(
      //           icon: Icon(Icons.delete),
      //           onPressed: () => favoriteController.deleteFavorite(item),
      //         ),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
