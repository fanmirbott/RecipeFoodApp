class CuisineModelDetail {
  final int id;
  final String title;
  final String photo;
  final String description;
  final double rating;
  final int timeRequired;

  CuisineModelDetail({
    required this.id,
    required this.title,
    required this.photo,
    required this.description,
    required this.rating,
    required this.timeRequired,
  });

  factory CuisineModelDetail.fromJson(Map<String, dynamic> json) {
    return CuisineModelDetail(
      id: json['id'],
      title: json['title'],
      photo: json['image'],
      description: json['description'],
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      timeRequired: int.tryParse(json['time_required'].toString()) ?? 0,
    );
  }
}
