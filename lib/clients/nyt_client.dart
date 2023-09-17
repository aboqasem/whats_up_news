import 'package:dio/dio.dart';

class NytClient extends DioMixin {
  static const String _baseUrl = 'https://api.nytimes.com/';
  static const String _articleSearchPath = 'svc/search/v2/articlesearch.json';

  NytClient() {
    options = BaseOptions(
      baseUrl: _baseUrl,
      contentType: Headers.jsonContentType,
      queryParameters: {
        'api-key': 'HTd5kp5oI8bDN4NTztmhZc30qSiuzaHl',
      },
    );

    httpClientAdapter = HttpClientAdapter();
  }

  Future<Response> getArticles({q = '', page = 0, List<String>? fl}) async {
    return get(
      _articleSearchPath,
      queryParameters: {
        'q': q,
        'page': page,
        'fl': fl?.join(','),
      },
    );
  }
}
