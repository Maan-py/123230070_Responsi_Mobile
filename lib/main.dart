import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsi/controllers/auth_controller.dart';
import 'package:responsi/controllers/home_controller.dart';
import 'package:responsi/models/favorite_game.dart';
// import 'package:responsi/models/favorite_game.dart';
import 'package:responsi/views/detail_view.dart';
// import 'package:responsi/views/favorite_view.dart';
import 'package:responsi/views/login_view.dart';
import 'package:responsi/views/main_wrapper.dart';
import 'package:responsi/views/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController(), permanent: true);
  Get.put(HomeController(), permanent: true);

  await Hive.initFlutter();

  Hive.registerAdapter(FavoriteGameAdapter());
  await Hive.openBox<FavoriteGame>("favorite_game");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return GetMaterialApp(
      title: 'Responsi',
      home: LoginView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: authController.isLoggedIn.value ? "/home" : "/login",
      getPages: [
        GetPage(name: "/login", page: () => LoginView()),
        GetPage(name: "/home", page: () => MainWrapper()),
        // GetPage(name: "/favorite", page: () => FavoriteView()),
        GetPage(name: "/profile", page: () => ProfileView()),
        GetPage(name: "/detail", page: () => DetailView()),
      ],
    );
  }
}
