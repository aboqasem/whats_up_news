// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      url: json['web_url'] as String,
      title: json['headline.main'] as String,
      pubDate: DateTime.parse(json['pub_date'] as String),
    );
