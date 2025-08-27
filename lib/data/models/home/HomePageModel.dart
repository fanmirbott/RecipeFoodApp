class HomePageModel {
  final String title;

  HomePageModel({required this.title});

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return HomePageModel(title: json['title']);
  }
}
