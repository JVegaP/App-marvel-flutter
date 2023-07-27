import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/presentation/detail/detail_comic_screen.dart';
import 'package:marvel_bia_app_flutter/presentation/home/home_screen.dart';

final routes = Routes();
class Routes {
  /// go to Home Screen
  openHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const HomeScreen()));
  }
  /// got to Detail Comic Screen
  openDetailScreen({required BuildContext context, required int id}) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => DetailComicScreen(id: id)));
  }
}