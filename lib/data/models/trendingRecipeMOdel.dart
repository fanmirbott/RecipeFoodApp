class TrendingRecipeModel {
  final String photo;
  final String title;
  final String description;
  final double rating;
  final int timeRequired;

  TrendingRecipeModel({
    required this.photo,
    required this.title,
    required this.description,
    required this.rating,
    required this.timeRequired,
  });

  factory TrendingRecipeModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipeModel(
      photo: json['photo'],
      title: json['title'],
      description: json['description'] ?? '',
      rating: (json['rating'] as num).toDouble(),
      timeRequired: json['timeRequired'] ?? 0,
    );
  }
}
