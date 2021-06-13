import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_and_shows/detail/detail_bindings.dart';
import 'package:movies_and_shows/detail/detail_screen.dart';
import 'package:movies_and_shows/home/home_bindings.dart';
import 'package:movies_and_shows/home/home_screen.dart';
import 'package:movies_and_shows/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies and Shows',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: HomeBindings(),
        ),
        GetPage(
            name: '/detail',
            page: () => DetailScreen(),
            binding: DetailBindings()),
      ],
      initialRoute: '/splash',
    );
  }
}
