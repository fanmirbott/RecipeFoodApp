class YourRecipeModel {
  final int id;
  final String photo;
  final String title;
  final double rating;
  final int timeRequired;
  final String description;

  YourRecipeModel({
    required this.id,
    required this.photo,
    required this.title,
    required this.rating,
    required this.timeRequired,
    required this.description,
  });

  factory YourRecipeModel.fromJson(Map<String, dynamic> json) {
    return YourRecipeModel(
      photo: json['photo'],
      title: json['title'],
      rating: (json['rating'] as num).toDouble(),
      timeRequired: json['timeRequired'],
      description: json['description'],
      id: json['id'],
    );
  }
}
