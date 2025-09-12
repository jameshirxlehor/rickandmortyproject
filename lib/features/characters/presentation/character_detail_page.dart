import 'package:flutter/material.dart';
import 'package:rickandmortyproject/features/characters/domain/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(character.image),
            ),
            const SizedBox(height: 20),
            Text(character.name,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 10),
            Text("Status: ${character.status}"),
            Text("Espécie: ${character.species}"),
          ],
        ),
      ),
    );
  }
}
