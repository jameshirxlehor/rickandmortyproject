import 'package:flutter/material.dart';
import 'package:rickandmortyproject/features/characters/presentation/character_list_page.dart';

class HomeAnimationPage extends StatefulWidget {
  @override
  _HomeAnimationPageState createState() => _HomeAnimationPageState();
}

class _HomeAnimationPageState extends State<HomeAnimationPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => CharacterListPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset("assets/images/animation_inicial.gif"),
        ),
      ),
    );
  }
}