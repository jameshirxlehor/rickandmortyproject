import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortyproject/features/characters/data/character_service.dart';
import 'package:rickandmortyproject/features/characters/domain/character.dart';
import 'package:rickandmortyproject/features/characters/presentation/character_detail_page.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final service = CharacterService(Dio());
  final ScrollController _scrollController = ScrollController();

  List<Character> characters = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreCharacters = true;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMoreCharacters) {
        _fetchCharacters();
      }
    });
  }

  Future<void> _fetchCharacters() async {
    setState(() => isLoading = true);
    try {
      final newCharacters = await service.getCharacters(page: currentPage);
      ScaffoldMessenger.of(context).clearSnackBars();
      setState(() {
        characters.addAll(newCharacters);
        currentPage++;
        if (newCharacters.isEmpty) hasMoreCharacters = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text("Sem conexão com a internet. Verifique sua rede."),
          backgroundColor: Colors.deepPurpleAccent,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PERSONAGENS",
          style: TextStyle(
              color: Colors.limeAccent,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF1C1C1C),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/cover.jpg",
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.2),
            ),
          ),
          ListView.builder(
            controller: _scrollController,
            itemCount: characters.length + 1,
            itemBuilder: (context, index) {
              if (index < characters.length) {
                final character = characters[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  color: const Color(0xFF2C2C2C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // cantos arredondados
                    side: const BorderSide(
                      color: Colors.lime, // cor da borda
                      width: 1,            // espessura
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
                    title: Text(character.name,style: TextStyle(color: Colors.white),),
                    subtitle: Row(
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
                        Text(character.status,style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CharacterDetailPage(character: character),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: hasMoreCharacters
                        ? const CircularProgressIndicator()
                        : const Text("Todos os personagens carregados"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
