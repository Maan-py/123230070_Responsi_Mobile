import 'package:hive/hive.dart';

part 'favorite_game.g.dart';

@HiveType(typeId: 0)
class FavoriteGame {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String genre;

  @HiveField(3)
  final String platform;

  @HiveField(4)
  final String thumbnail;

  @HiveField(5)
  final String releaseDate;

  @HiveField(6)
  final String publisher;

  @HiveField(7)
  final String developer;

  @HiveField(8)
  final String description;

  // @HiveField(9)
  // final String screenshots;

  FavoriteGame({
    required this.id,
    required this.title,
    required this.genre,
    required this.platform,
    required this.thumbnail,
    required this.releaseDate,
    required this.publisher,
    required this.developer,
    required this.description,
    // required this.screenshots,
  });
}
