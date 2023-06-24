import 'dart:convert';

import 'article.dart';

class NewsResponse {
  String? status;
  String? code;
  String? message;

  int? totalResults;
  List<Article>? articles;

  NewsResponse(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  factory NewsResponse.fromMap(Map<String, dynamic> data) => NewsResponse(
        status: data['status'] as String?,
        code: data['code'] as String?,
        message: data['message'] as String?,
        totalResults: data['totalResults'] as int?,
        articles: (data['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NewsResponse].
  factory NewsResponse.fromJson(String data) {
    return NewsResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NewsResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
