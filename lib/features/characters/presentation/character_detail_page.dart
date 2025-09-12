import 'package:flutter/material.dart';
import 'package:rickandmortyproject/features/characters/domain/character.dart';
import 'infoBox.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // imagem do personagem
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      character.image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // nome estilizado
                  Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: character.status.toLowerCase() == "alive"
                            ? Colors.green
                            : character.status.toLowerCase() == "dead"
                            ? Colors.red
                            : Colors.grey,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        character.status,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // informações extras
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoBox(title: "Specie", value: character.species),
                      InfoBox(title: "ID", value: "#${character.id}"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InfoBox(title: "Origin", value: "${character.origin}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text('VOLTAR'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFF2C2C2C)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

