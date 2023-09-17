import 'package:whats_up_news/clients/nyt_client.dart';
import 'package:whats_up_news/models/articles/article.dart';

class ArticlesService {
  final NytClient _client = NytClient();

  Future<List<Article>> getArticles({query = '', page = 0}) async {
    return await _client.getArticles(q: query, page: page).then((response) {
      final docs = response.data['response']?['docs'];
      if (docs is! List) {
        return [];
      }

      return docs.map<Article>((article) => Article.fromJson(article)).toList();
    });
  }
}
