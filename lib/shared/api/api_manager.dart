import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/news_response/news_response.dart';
import 'package:newsapp/models/sourses_response/sources_response.dart';

class apiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "e95fceda6d274d78bade4ba56ba9191b";
  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "apiKey": apiKey,
      "category": categoryId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    //https://newsapi.org/v2/everything?apiKey=e95fceda6d274d78bade4ba56ba9191&sources=bbc-news
    var url = Uri.https(baseUrl, "/v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponse newsrespone = NewsResponse.fromJson(json);

    return newsrespone;
  }

  static Future<NewsResponse> searchNews(String textSearch) async {
    //https://newsapi.org/v2/top-headlines?q=mmmmm&apiKey=e95fceda6d274d78bade4ba56ba9191b
    var url = Uri.https(baseUrl, "/v2/top-headlines", {
      "q": textSearch,
      "apiKey": apiKey,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponse newsrespone = NewsResponse.fromJson(json);

    return newsrespone;
  }
}
