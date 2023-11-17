import 'package:flutter/material.dart';
import 'pages/splash.dart';
import 'theme/themeData.dart';

void main() => runApp(const MyApp());

/// Clase myApp principal de ejecución de aplicación
/// @Extends: StalessWidget
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightColorScheme,
      darkTheme: darkColorScheme,
      themeMode: ThemeMode.light,
      title: 'Material App',
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
