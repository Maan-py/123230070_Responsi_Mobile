import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.find();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Browse Games")),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.red));
        }

        if (homeController.games.isEmpty) {
          return Center(child: Text("Tidak ada data TV show yang tersedia"));
        }

        return GridView.builder(
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: homeController.games.length,
          itemBuilder: (context, index) {
            final game = homeController.games[index];

            return GestureDetector(
              onTap: () {
                Get.toNamed("/detail", arguments: {"id": game.id});
              },
              child: Card(
                color: Colors.grey[900],
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // gambar
                    Expanded(
                      child: Image.network(
                        game.thumbnail,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // judul
                          Text(
                            game.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                game.genre,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            game.platform,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
