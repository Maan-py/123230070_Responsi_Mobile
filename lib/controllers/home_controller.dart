import 'package:get/get.dart';
import 'package:responsi/models/game.dart';
import 'package:responsi/services/api_service.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool isLoading = false.obs;
  RxList games = <Game>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchGames();
  }

  void fetchGames() async {
    try {
      isLoading.value = true;
      final result = await ApiService.getGames();
      games.value = result;
      print("TV Shows loaded: $games");
    } catch (e) {
      print("Error fetching TV shows: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
