class newsModel {
  String imagePath;
  String newseId;
  String title;
  String sourceName;
  String date;

  newsModel(
      {required this.date,
      required this.newseId,
      required this.imagePath,
      required this.sourceName,
      required this.title});

  static List<newsModel> news = [
    newsModel(
        date: "3 hours ago",
        newseId: "336156",
        imagePath: "assets/images/NewsTest.png",
        sourceName: "BBC news",
        title: "Why are football's biggest clubs starting a new tournament?"),
    newsModel(
        date: "3 hours ago",
        newseId: "336156",
        imagePath: "assets/images/NewsTest.png",
        sourceName: "BBC news",
        title: "Why are football's biggest clubs starting a new tournament?"),
    newsModel(
        date: "3 hours ago",
        newseId: "336156",
        imagePath: "assets/images/NewsTest.png",
        sourceName: "BBC news",
        title: "Why are football's biggest clubs starting a new tournament?"),
    newsModel(
        date: "3 hours ago",
        newseId: "336156",
        imagePath: "assets/images/NewsTest.png",
        sourceName: "BBC news",
        title: "Why are football's biggest clubs starting a new tournament?"),
    newsModel(
        date: "3 hours ago",
        newseId: "336156",
        imagePath: "assets/images/NewsTest.png",
        sourceName: "BBC news",
        title: "Why are football's biggest clubs starting a new tournament?"),
    newsModel(
        date: "3 hours ago",
        newseId: "336156",
        imagePath: "assets/images/NewsTest.png",
        sourceName: "BBC news",
        title: "Why are football's biggest clubs starting a new tournament?"),
  ];
}
