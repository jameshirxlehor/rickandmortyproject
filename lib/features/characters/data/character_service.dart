import 'package:dio/dio.dart';
import 'package:rickandmortyproject/features/characters/data/character_model.dart';
import 'package:rickandmortyproject/features/characters/domain/character_response.dart';
import 'package:rickandmortyproject/features/characters/domain/character_repository.dart';


class CharacterService implements CharacterRepository {
  final Dio dio;

  CharacterService(this.dio);

  @override
  Future<CharacterResponse> getCharacters({int page = 1}) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character?page=$page',
      options: Options(receiveTimeout: const Duration(seconds: 5)),
    );

    if (response.statusCode != 200) {
      throw 'Erro ao buscar personagens';
    }

    final data = response.data;

    return CharacterResponse(
      characters: (data['results'] as List)
          .map((json) => CharacterModel.fromJson(json))
          .toList(),
      totalPages: data['info']['pages'],
    );
  }

}