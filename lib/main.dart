import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyproject/features/characters/presentation/character_list_page.dart';
import 'features/characters/data/character_service.dart';
import 'package:rickandmortyproject/features/characters/presentation/home_animation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dio = Dio();
  CharacterService get service => CharacterService(dio);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeAnimationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}