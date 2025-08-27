class ChefsModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePhoto;
  final String presentation;
  final int recipesCount;
  final int followingCount;
  final int followerCount;

  ChefsModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
    required this.presentation,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,

  });

  factory ChefsModel.fromJson(Map<String, dynamic> json) {
    return ChefsModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      firstName: json['firstName'],
      username: json['username'],
      lastName: json['lastName'],
      presentation: json['presentation'],
      followerCount: json['followerCount'],
      followingCount: json['followingCount'],
      recipesCount: json['recipesCount'],
    );
  }

  @override
  String toString() {
    return 'ChefsModel{id: $id, username: $username, firstName: $firstName, lastName: $lastName, profilePhoto: $profilePhoto, presentation: $presentation, recipesCount: $recipesCount, followingCount: $followingCount, followerCount: $followerCount}';
  }
}


class ChefDetailModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final String photo;
  final int timeRequired;
  final double rating;

  ChefDetailModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory ChefDetailModel.fromJson(Map<String, dynamic> json) {
    return ChefDetailModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
class TopChefModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePhoto;

  TopChefModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.profilePhoto,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      firstName: json['firstName'],
      username: json['username'],
      lastName: json['lastName'],
    );
  }
}
