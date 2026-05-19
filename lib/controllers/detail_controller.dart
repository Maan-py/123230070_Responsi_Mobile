import 'package:get/get.dart';
import 'package:responsi/models/game.dart';
import 'package:responsi/services/api_service.dart';

class DetailController extends GetxController {
  RxBool isLoading = false.obs;

  Rxn<Game> gameDetail = Rxn<Game>();

  void fetchDetailGame(int id) async {
    try {
      isLoading.value = true;
      final result = await ApiService.getGameDetail(id);
      gameDetail.value = result;
    } catch (e) {
      print("Error fetching detail: $e");
    }
    {
      isLoading.value = false;
    }
  }
}
