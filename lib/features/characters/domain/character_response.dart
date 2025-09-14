import 'package:rickandmortyproject/features/characters/data/character_model.dart';

class CharacterResponse {
  final List<CharacterModel> characters;
  final int totalPages;

  CharacterResponse({
    required this.characters,
    required this.totalPages,
  });
}