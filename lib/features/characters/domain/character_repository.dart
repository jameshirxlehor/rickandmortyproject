import 'package:rickandmortyproject/features/characters/domain/character_response.dart';


abstract class CharacterRepository {
  Future<CharacterResponse> getCharacters({int page = 1});
}