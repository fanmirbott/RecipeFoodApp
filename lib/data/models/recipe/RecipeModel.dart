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



class TrendingModel {
  final int id;
  final int categoryId;
  final String title;
  final String description;
  final String difficulty;
  final String photo;
  final int timeRequired;
  final double rating;

  TrendingModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.timeRequired,
    required this.rating,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) {
    return TrendingModel(
      id: json['id'],
      categoryId: json['categoryId'],
      title: json['title'] ?? '',
      description: json['description'],
      difficulty: json['difficulty'],
      photo: json['photo'],
      timeRequired: json['timeRequired'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}

class TrendingRecipeModel {
  final String photo;
  final String title;
  final String description;
  final double rating;
  final int timeRequired;

  TrendingRecipeModel({
    required this.photo,
    required this.title,
    required this.description,
    required this.rating,
    required this.timeRequired,
  });

  factory TrendingRecipeModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipeModel(
      photo: json['photo'],
      title: json['title'],
      description: json['description'] ?? '',
      rating: (json['rating'] as num).toDouble(),
      timeRequired: json['timeRequired'] ?? 0,
    );
  }
}


class CommunityModel {
  final int id;
  final String title;
  final String description;
  final String photo;
  final int timeRequired;
  final double rating;
  final int reviewsCount;
  final DateTime created;
  final CommunityUserModel user;

  CommunityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
    required this.timeRequired,
    required this.rating,
    required this.reviewsCount,
    required this.created,
    required this.user,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'] ?? '',
      timeRequired: (json['timeRequired'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      created: DateTime.tryParse(json['created'] ?? '') ?? DateTime.now(),
      user: CommunityUserModel.fromJson(json['user']),
    );
  }
}

class CommunityUserModel {
  final int id;
  final String profilePhoto;
  final String username;
  final String firstName;
  final String lastName;

  CommunityUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory CommunityUserModel.fromJson(Map<String, dynamic> json) {
    return CommunityUserModel(
      id: json["id"],
      profilePhoto: json["profilePhoto"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}

class CuisineModelRecipe {
  final int id;
  final String title;
  final String photo;
  final String description;
  final double rating;
  final int timeRequired;

  CuisineModelRecipe({
    required this.id,
    required this.title,
    required this.photo,
    required this.description,
    required this.rating,
    required this.timeRequired,
  });

  factory CuisineModelRecipe.fromJson(Map<String, dynamic> json) {
    return CuisineModelRecipe(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
      description: json['description'],
      rating: (json['rating'] as num).toDouble(),
      timeRequired: (json['timeRequired'] as num).toInt(),
    );
  }
}

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
