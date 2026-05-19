import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/controllers/auth_controller.dart';

class ProfileView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[800],
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 20),
              Obx(
                () => Text(
                  authController.username.value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Kesan: Yah lumayan pusing ya mobile ini, beda sama web styling dan widgetnya. Enaknya mobile ini cuma pusing mikirin 1 layout doang, gak usah mikir responsivenya (kali).",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                "Pesan: Praktikumnya jangan kebanyakan online mas. Kalo online kadang lebih milih cari video dari yutub hehe.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  authController.logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Logout", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
