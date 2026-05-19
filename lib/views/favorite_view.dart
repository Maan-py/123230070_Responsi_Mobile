import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/controllers/favorite_controller.dart';
import 'package:responsi/models/game.dart';

class FavoriteView extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());
  FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Favorit")),
      body: Obx(() {
        if (favoriteController.favoriteList.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada film favorit yang disimpan.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: favoriteController.favoriteList.length,
          itemBuilder: (context, index) {
            final game = favoriteController.favoriteList[index];

            return Card(
              color: Colors.grey[900],
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    game.thumbnail,
                    width: 50,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  game.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        game.publisher,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.toNamed('/detail', arguments: {'id': game.id});
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    favoriteController.toggleFavorite(
                      Game(
                        id: game.id,
                        title: game.title,
                        genre: game.genre,
                        platform: game.platform,
                        thumbnail: game.thumbnail,
                        releaseDate: game.releaseDate,
                        publisher: game.publisher,
                        developer: game.developer,
                        description: game.description,
                        // screenshots: game.screenshots,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
