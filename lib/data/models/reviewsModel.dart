class ReviewsModel {
  final String id;
  final String title;
  final String photo;
  final double rating;
  final int reviewsCount;

  ReviewsModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.rating,
    required this.reviewsCount,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(id: json['id'],
        title: json['title'],
        photo: json['photo'],
        rating: (json['rating']as num).toDouble(),
        reviewsCount: json['reviewsCount']);
  }
}