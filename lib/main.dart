import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/marvel_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MarvelApp());
}