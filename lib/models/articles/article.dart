import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(createToJson: false)
class Article with EquatableMixin {
  @JsonKey(name: 'web_url')
  final String url;

  @JsonKey(name: 'headline.main')
  final String title;

  @JsonKey(name: 'pub_date')
  final DateTime pubDate;

  Article({
    required this.url,
    required this.title,
    required this.pubDate,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    json['headline.main'] = json['headline']['main'];

    return _$ArticleFromJson(json);
  }

  @override
  List<Object?> get props => [url, title, pubDate];
}
