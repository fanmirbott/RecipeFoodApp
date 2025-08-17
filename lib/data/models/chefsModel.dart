class ChefsModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePhoto;
  final String presentation;
  final double recipesCount;
  final double followingCount;
  final double followerCount;

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
      followerCount: (json['followerCount'] as num).toDouble(),
      followingCount: (json['followingCount'] as num).toDouble(),
      recipesCount: (json['recipesCount'] as num).toDouble(),
    );
  }
}
