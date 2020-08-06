import 'package:flutter/material.dart';
import 'screens/detail_screen.dart';
import 'screens/list_screen.dart';
import 'screens/new_post_screen.dart';

class App extends StatelessWidget {

  static final routes = {
    ListScreen.routeName: (context) => ListScreen(),
    DetailScreen.routeName: (context) => DetailScreen(),
    NewPostScreen.routeName: (context) => NewPostScreen(),
  //   ImgPickerScreen.routeName: (context) => ImgPickerScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      routes: App.routes
    );
  }
}