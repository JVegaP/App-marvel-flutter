import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_bia_app_flutter/core/themes/app_theme.dart';
import 'package:marvel_bia_app_flutter/presentation/detail/provider/detail_comic_provider.dart';
import 'package:marvel_bia_app_flutter/presentation/home/provider/home_provider.dart';
import 'package:marvel_bia_app_flutter/presentation/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class MarvelApp extends StatefulWidget {
  const MarvelApp({
    Key? key
  }) : super(key: key);

  @override
  MarvelAppState createState() => MarvelAppState();
}

class MarvelAppState extends State<MarvelApp> {
  static final GlobalKey<NavigatorState> _globalKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey,
      statusBarBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DetailComicProvider()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        navigatorKey: _globalKey,
        theme: AppTheme.getAppTheme(),
      ),
    );
  }
}