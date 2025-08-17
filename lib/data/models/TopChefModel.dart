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
