import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsi/models/favorite_game.dart';
import 'package:responsi/models/game.dart';

class FavoriteController extends GetxController {
  final Box<FavoriteGame> favoriteBox = Hive.box<FavoriteGame>('favorite_game');
  RxList<FavoriteGame> favoriteList = <FavoriteGame>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    favoriteList.value = favoriteBox.values.toList();
  }

  void toggleFavorite(Game game) {
    if (isFavorite(game.id)) {
      favoriteBox.delete(game.id);
      Get.snackbar(
        "Favorit",
        "${game.title} dihapus dari favorit",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      final favShow = FavoriteGame(
        id: game.id,
        title: game.title,
        genre: game.genre,
        platform: game.platform,
        thumbnail: game.thumbnail,
        releaseDate: game.releaseDate,
        publisher: game.publisher,
        developer: game.developer,
        description: game.description,
        // screenshots: game.screenshots!,
      );

      favoriteBox.put(game.id, favShow);
      Get.snackbar(
        "Favorit",
        "${game.title} disimpan ke favorit",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    loadFavorites();
  }

  bool isFavorite(int id) {
    return favoriteBox.containsKey(id);
  }
}
