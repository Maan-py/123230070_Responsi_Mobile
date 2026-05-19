class Game {
  final int id;
  final String title;
  final String genre;
  final String platform;
  final String thumbnail;
  final String releaseDate;
  final String publisher;
  final String developer;
  final String description;
  // final String? screenshots;

  Game({
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

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      genre: json["genre"] ?? "",
      platform: json["platform"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      releaseDate: json["release_date"] ?? "",
      publisher: json["publisher"] ?? "",
      developer: json["developer"] ?? "",
      description: json["description"] ?? "",
      // screenshots: json["screenshots"][0]["image"] ?? "",
    );
  }
}
