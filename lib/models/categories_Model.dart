import 'dart:ui';

class categoriesModel {
  String? id;
  String title;
  String? imagePath;
  Color color;

  categoriesModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.color,
  });

  static List<categoriesModel> categories = [
    categoriesModel(
        id: "sports",
        imagePath: "ball.png",
        title: "Sports",
        color: Color(0xffC91C22)),
    categoriesModel(
        id: "business",
        imagePath: "bussines.png",
        title: "Bussines",
        color: Color(0xff003E90)),
    categoriesModel(
        id: "general",
        imagePath: "environment.png",
        title: "General",
        color: Color(0xffCF7E48)),
    categoriesModel(
        id: "health",
        imagePath: "health.png",
        title: "Health",
        color: Color(0xffED1E79)),
    categoriesModel(
        id: "technology",
        imagePath: "Politics.png",
        title: "Technology",
        color: Color(0xff4882CF)),
    categoriesModel(
        id: "science",
        imagePath: "science.png",
        title: "Science",
        color: Color(0xffF2D352)),
  ];
}
