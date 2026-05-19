import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsi/controllers/home_controller.dart';
import 'package:responsi/views/favorite_view.dart';
import 'package:responsi/views/home_view.dart';
import 'package:responsi/views/profile_view.dart';
// import 'package:tugas_film/controllers/home_controller.dart';
// import 'package:tugas_film/views/favorite_view.dart';
// import 'package:tugas_film/views/home_view.dart';
// import 'package:tugas_film/views/profile_view.dart';

class MainWrapper extends StatelessWidget {
  final HomeController homeController = HomeController();

  final List<Widget> pages = [HomeView(), FavoriteView(), ProfileView()];
  MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => pages[homeController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: homeController.currentIndex.value,
          onTap: homeController.changeTab,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey, // Warna menu saat tidak aktif
          // backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
