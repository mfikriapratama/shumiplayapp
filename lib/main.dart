import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';
import 'pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ShumiPlayApp());
}

class ShumiPlayApp extends StatelessWidget {
  const ShumiPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShumiPlay!',
      debugShowCheckedModeBanner: false,
      theme: ShumiTheme.theme,
      home: const SplashPage(),
    );
  }
}
