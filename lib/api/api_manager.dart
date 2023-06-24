import 'package:http/http.dart' as http;
import 'package:newsapp/api/model/news_response/news_response.dart';
import 'package:newsapp/api/model/sources_response/sources_response.dart';

class ApiManager {
  static const String apiKey = '7c5e15e5a01e4f1286ff449d7ec57e97';
  static const String baseUrl = 'newsapi.org';
  static Future<SourcesResponse> getNewsSources(String category) async {
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': category,
    });
    var response = await http.get(uri);
    var jsonString = response.body;
    var sourcesResponse = SourcesResponse.fromJson(jsonString);

    return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String category) async {
    var uri = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': category,
    });
    var response = await http.get(uri);
    var jsonString = response.body;
    var newsResponse = NewsResponse.fromJson(jsonString);

    return newsResponse;
  }
}
