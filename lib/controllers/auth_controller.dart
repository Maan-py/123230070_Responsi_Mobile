import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxString username = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool("isLogin") ?? false;
    username.value = prefs.getString("username") ?? "";
  }

  void login(String user, String password) async {
    if (user == "maan" && password == "maan") {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setBool("isLogin", true);
      await prefs.setString("username", user);

      isLoggedIn.value = true;
      username.value = user;

      Get.offAllNamed("/home");
    } else {
      Get.snackbar(
        "Login Gagal!",
        "Username atau password salah",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
    username.value = "";
    Get.offAllNamed("/login");
  }
}
