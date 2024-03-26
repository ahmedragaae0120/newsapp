import 'package:newsapp/models/news_response/atricle.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  NewsResponse(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    code = json["code"];
    message = json["message"];
    articles = json["articles"] == null
        ? null
        : (json["articles"] as List).map((e) => Article.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["totalResults"] = totalResults;
    if (articles != null) {
      _data["articles"] = articles?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
