import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/pages/home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:to_do/theme/theme.dart';

void main() async {
  //1- init the hive
  await Hive.initFlutter();

  //2- open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO Do List',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: ThemeMode.system, // device controls theme
      home: const HomePage(),
    );
  }
}
