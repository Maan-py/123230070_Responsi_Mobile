import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/controllers/detail_controller.dart';
import 'package:responsi/controllers/favorite_controller.dart';

class DetailView extends StatelessWidget {
  final DetailController detailController = Get.put(DetailController());
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final int gameId = Get.arguments['id'] as int;
    detailController.fetchDetailGame(gameId);
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Obx(() {
        if (detailController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          );
        }

        final detailGame = detailController.gameDetail.value;

        if (detailGame == null) {
          return const Center(
            child: Text(
              "Data detail tidak ditemukan",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return SingleChildScrollView(
          // padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar
              Center(
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    detailGame.thumbnail,
                    height: 400,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul
                        Expanded(
                          child: Text(
                            detailGame.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            detailGame.genre,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 6),
                        Chip(
                          label: Text(
                            detailGame.platform,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 16),

                    // Genre
                    // Wrap(
                    //   spacing: 8,
                    //   children: [
                    //     Text(
                    //       // detailShow.genres.join(", "),
                    //       detailGame.publisher,
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 12,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          // child: Obx(() {
                          //   return ElevatedButton.icon(
                          //     onPressed: () {},
                          //     icon: const Icon(Icons.add, color: Colors.white),
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.blue,
                          //       foregroundColor: Colors.white,
                          //       minimumSize: const Size(double.infinity, 45),
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(12),
                          //       ),
                          //     ),
                          //     label: Text(
                          //       "Get",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   );
                          // }),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            label: Text(
                              "Get",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          // child: Obx(() {
                          //   // bool isFav = favoriteController.favoriteList.any(
                          //   //   (element) => element.id == detailGame.id,
                          //   // );
                          //   // return IconButton(
                          //   //   icon: Icon(
                          //   //     isFav ? Icons.favorite : Icons.favorite_border,
                          //   //     color: isFav ? Colors.red : Colors.white,
                          //   //   ),
                          //   //   onPressed: () {
                          //   //     favoriteController.toggleFavorite(detailShow);
                          //   //   },
                          //   // );
                          // }),
                        ),
                        SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          // child: Obx(() {
                          //   // bool isFav = favoriteController.favoriteList.any(
                          //   //   (element) => element.id == detailGame.id,
                          //   // );
                          //   // return IconButton(
                          //   //   icon: Icon(
                          //   //     isFav ? Icons.favorite : Icons.favorite_border,
                          //   //     color: isFav ? Colors.red : Colors.white,
                          //   //   ),
                          //   //   onPressed: () {
                          //   //     favoriteController.toggleFavorite(detailShow);
                          //   //   },
                          //   // );
                          // }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(detailGame.releaseDate),
                        const SizedBox(width: 5),
                        Text(detailGame.publisher),
                        const SizedBox(width: 5),
                        Text(detailGame.developer),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Screenshots",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      // children: [
                      //   Image.network(
                      //     detailGame.screenshots!,
                      //     width: 50,
                      //     height: 70,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Overview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text(
                      detailGame.description.replaceAll(RegExp(r'<[^>]*>'), ''),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
