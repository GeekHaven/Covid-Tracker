import 'package:http/http.dart' as http;
import './article.dart';
import 'dart:convert';
import 'package:newsapi_client/newsapi_client.dart';

class IndiaNews {
  final client = NewsapiClient("30494cb548ce46bd92d5acad9b208c1d");

  List<Article> news = [];

  Future<void> getIndiaNews(bool code) async {
    String url;
    if (code == false)
      url =
          "http://newsapi.org/v2/top-headlines?q=COVID&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=30494cb548ce46bd92d5acad9b208c1d";
    else
      url =
          "http://newsapi.org/v2/top-headlines?q=COVID&country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=30494cb548ce46bd92d5acad9b208c1d";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
