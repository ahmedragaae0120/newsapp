import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/descriptionNews/descriptionNews_screen.dart';
import 'package:newsapp/layout/home/home_screen.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/shared/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => homeProvider(), child: const newsApp()));
}

class newsApp extends StatelessWidget {
  const newsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsApp",
      debugShowCheckedModeBanner: false,
      theme: appTheme.lightTheme,
      themeMode: ThemeMode.light,
      routes: {
        homeScreen.route_name: (context) => homeScreen(),
      },
      initialRoute: homeScreen.route_name,
    );
  }
}
