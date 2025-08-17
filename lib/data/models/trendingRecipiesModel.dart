class TrendingModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final String photo;
  final int timeRequired;
  final double rating;

  TrendingModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      difficulty: json['difficulty'] ?? '',
      photo: json['photo'] ?? '',
      timeRequired: json['timeRequired'] as int,
      rating: (json['rating'] as num).toDouble(), // muhim!
    );
  }
}
