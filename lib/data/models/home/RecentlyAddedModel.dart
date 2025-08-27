class RecentlyAddedModel {
  final String photo;
  final String title;
  final double rating;
  final int timeRequired;

  RecentlyAddedModel({
    required this.photo,
    required this.title,
    required this.rating,
    required this.timeRequired,
  });

  factory RecentlyAddedModel.fromJson(Map<String, dynamic> json) {
    return RecentlyAddedModel(
        photo: json['photo'],
        title: json['title'],
        rating: (json['rating'] as num).toDouble(),
        timeRequired: json['timeRequired']
    );
  }
}
