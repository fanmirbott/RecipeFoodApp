class RecipeDetailModel {
  final int id;
  final String title;
  final String photo;
  final int rating;
  final int reviewsCount;
  final User user;

  RecipeDetailModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.rating,
    required this.reviewsCount,
    required this.user,
  });

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
