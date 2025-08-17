class YourRecipeModel {
  final String photo;
  final String title;
  final double rating;
  final int timeRequired;

  YourRecipeModel({
    required this.photo,
    required this.title,
    required this.rating,
    required this.timeRequired,
  });

  factory YourRecipeModel.fromJson(Map<String, dynamic> json) {
    return YourRecipeModel(
        photo: json['photo'],
        title: json['title'],
        rating: (json['rating'] as num).toDouble(),
        timeRequired: json['timeRequired']
    );
  }
}
