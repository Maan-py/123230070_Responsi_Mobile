import "dart:convert";

import "package:http/http.dart" as http;
import "package:responsi/models/game.dart";

class ApiService {
  static const String baseUrl = "https://www.freetogame.com/api/games";

  static Future<List<Game>> getGames() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final games = jsonDecode(response.body);
      print(games);
      return games.map<Game>((e) => Game.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load Games");
    }
  }

  static Future<Game> getGameDetail(int id) async {
    final response = await http.get(Uri.parse("https://www.freetogame.com/api/game?id=$id"));

    if (response.statusCode == 200) {
      final game = jsonDecode(response.body);

      return Game.fromJson(game);
    } else {
      throw Exception("Failed to load Game detail");
    }
  }
}
