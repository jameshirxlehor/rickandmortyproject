import 'package:dio/dio.dart';
import 'package:rickandmortyproject/features/characters/data/character_model.dart';
import 'package:rickandmortyproject/features/characters/domain/character.dart';
import 'package:rickandmortyproject/features/characters/domain/character_repository.dart';


class CharacterService implements CharacterRepository {
  final Dio dio;

  CharacterService(this.dio);

  @override
  Future<List<Character>> getCharacters({int page = 1}) async {
    final response = await dio.get('https://rickandmortyapi.com/api/character?page=$page', options: Options(receiveTimeout: Duration(seconds: 5)));
    return (response.data['results'] as List)
        .map((json) => CharacterModel.fromJson(json))
        .toList();
  }
}