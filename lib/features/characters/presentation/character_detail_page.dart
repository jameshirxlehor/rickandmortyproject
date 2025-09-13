import 'package:flutter/material.dart';
import 'package:rickandmortyproject/features/characters/domain/character.dart';
import 'simple_information_box.dart';

class CharacterDetailPage extends StatefulWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/portal.jpg",
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.2),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Card de informações
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    border: Border.all(color: Colors.lime),
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
                      // ID personagem
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.limeAccent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                              child: Text(
                                "#${widget.character.id}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Imagem personagem
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          widget.character.image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // nome estilizado
                      Text(
                        widget.character.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons.circle,
                          //   size: 12,
                          //   color: widget.character.status.toLowerCase() == "alive"
                          //       ? Colors.lightGreen
                          //       : widget.character.status.toLowerCase() == "dead"
                          //       ? Colors.redAccent
                          //       : Colors.grey,
                          // ),
                          const SizedBox(width: 6),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: widget.character.status.toLowerCase() == "alive"
                                  ? Colors.lightGreen
                                  : widget.character.status.toLowerCase() == "dead"
                                  ? Colors.redAccent
                                  : Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                              child: Text(
                                widget.character.status,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   widget.character.status,
                          //   style: const TextStyle(color: Colors.white70),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // informações extras
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          simpleInformationBox(title: "Specie", value: widget.character.species,colorThemeInfo: Colors.deepPurpleAccent,),
                          const SizedBox(height: 6),
                          simpleInformationBox(title: "Origin", value: widget.character.origin,colorThemeInfo: Colors.tealAccent,)
                        ],
                      ),
                    ],
                  ),
                ),
                // Botão para voltar a página
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.limeAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                              side: BorderSide(color: Colors.lime)
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shadowColor: Colors.black.withOpacity(0.5),
                            elevation: 10,
                          ),
                          child: const Text('VOLTAR',style: TextStyle(color: Colors.black87),),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

