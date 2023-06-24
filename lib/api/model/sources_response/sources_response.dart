import 'dart:convert';

import 'source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message;

  SourcesResponse({this.status, this.sources, this.code, this.message});

  factory SourcesResponse.fromMap(Map<String, dynamic> data) {
    return SourcesResponse(
      status: data['status'] as String?,
      code: data['code'] as String?,
      message: data['message'] as String?,
      sources: (data['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'code': code,
        'message': message,
        'sources': sources?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SourcesResponse].
  factory SourcesResponse.fromJson(String data) {
    return SourcesResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SourcesResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
