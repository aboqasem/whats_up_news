// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:whats_up_news/routes/articles/articles.dart' as _i1;
import 'package:whats_up_news/routes/home/home.dart' as _i2;
import 'package:whats_up_news/routes/search/search.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesRouteArgs>(
          orElse: () => const ArticlesRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ArticlesPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SearchPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ArticlesPage]
class ArticlesRoute extends _i4.PageRouteInfo<ArticlesRouteArgs> {
  ArticlesRoute({
    _i5.Key? key,
    String title = 'Articles',
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ArticlesRoute.name,
          args: ArticlesRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticlesRoute';

  static const _i4.PageInfo<ArticlesRouteArgs> page =
      _i4.PageInfo<ArticlesRouteArgs>(name);
}

class ArticlesRouteArgs {
  const ArticlesRouteArgs({
    this.key,
    this.title = 'Articles',
  });

  final _i5.Key? key;

  final String title;

  @override
  String toString() {
    return 'ArticlesRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i5.Key? key,
    String title = 'Home',
    List<_i4.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<HomeRouteArgs> page =
      _i4.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.title = 'Home',
  });

  final _i5.Key? key;

  final String title;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.SearchPage]
class SearchRoute extends _i4.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i5.Key? key,
    String title = 'Search',
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i4.PageInfo<SearchRouteArgs> page =
      _i4.PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.title = 'Search',
  });

  final _i5.Key? key;

  final String title;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, title: $title}';
  }
}
