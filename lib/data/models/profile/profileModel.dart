class ProfileModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;
  final String presentation;
  final int recipesCount;
  final int followingCount;
  final int followerCount;

  ProfileModel( {
    required this.id,
    required this.username,
    required this.profilePhoto,
    required this.lastName,
    required this.firstName,
    required this.recipesCount,
    required this.presentation,
    required this.followingCount,
    required this.followerCount,
  });


  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      presentation: json['presentation'],
      recipesCount: json['recipesCount'],
      followingCount: json['followingCount'],
      followerCount: json['followerCount']
    );
  }
}
