import 'package:complete_ecommerce/src/models/model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var isFavorite = false.obs;
  var favoriteItems = <product>[].obs;

  void toggleFavorite() {
    isFavorite.toggle();
  }

  addToFavorites(product Product) {
    favoriteItems.add(Product);
  }

  void deleteFavorite(int index) {
    favoriteItems.removeAt(index);
  }

  List get isFavoriteList => favoriteItems.toList();

  isProductFavorite(product product) {}
}
