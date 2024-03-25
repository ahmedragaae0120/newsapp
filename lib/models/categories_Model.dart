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
        id: "1212323",
        imagePath: "ball.png",
        title: "Sports",
        color: Color(0xffC91C22)),
    categoriesModel(
        id: "1212323",
        imagePath: "bussines.png",
        title: "Bussines",
        color: Color(0xff003E90)),
    categoriesModel(
        id: "1212323",
        imagePath: "environment.png",
        title: "Environment",
        color: Color(0xffCF7E48)),
    categoriesModel(
        id: "1212323",
        imagePath: "health.png",
        title: "Health",
        color: Color(0xffED1E79)),
    categoriesModel(
        id: "1212323",
        imagePath: "Politics.png",
        title: "Politics",
        color: Color(0xff4882CF)),
    categoriesModel(
        id: "1212323",
        imagePath: "science.png",
        title: "Science",
        color: Color(0xffF2D352)),
  ];
}
