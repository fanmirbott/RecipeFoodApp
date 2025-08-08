class CuisineModelRecipe {
  final int id;
  final String title;
  final String photo;
  final String description;
  final double rating;
  final int timeRequired;

  CuisineModelRecipe({
    required this.id,
    required this.title,
    required this.photo,
    required this.description,
    required this.rating,
    required this.timeRequired,
  });

  factory CuisineModelRecipe.fromJson(Map<String, dynamic> json) {
    return CuisineModelRecipe(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      photo: json['photo'] ?? '',
      description: json['description'] ?? '',
      rating: double.tryParse(json['rating']?.toString() ?? '0') ?? 0.0,
      timeRequired: int.tryParse(json['timeRequired']?.toString() ?? '0') ?? 0,
    );
  }
}
