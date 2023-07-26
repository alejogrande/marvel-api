import 'package:flutter/material.dart';
import 'package:marvel_api/ui/pages/characters/characters_page.dart';
import 'package:marvel_api/ui/pages/comics/comic_page.dart';
import 'package:marvel_api/ui/pages/home/home_page.dart';
import 'package:marvel_api/ui/pages/root/root/root_page.dart';
import 'package:marvel_api/utils/constans.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.home: (_) => const HomePage(),
  Routes.comics: (_) => const ComicPage(),
  Routes.characters: (_) => const CharacterPage(),
  Routes.root: (_) => RootPage(),
};
