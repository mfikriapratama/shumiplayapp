import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shumiplayapp/pages/pages.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
