import 'package:rickandmortyproject/features/characters/domain/character.dart';

class CharacterModel extends Character{
  String origin;

  CharacterModel({
    required super.id,
    required super.name,
    required super.image,
    required super.status,
    required super.species,
    required this.origin,
  });

  factory CharacterModel.fromJson(Map<String,dynamic> json){
    return CharacterModel(
        id: json['id'] ?? 'unknow',
        name: json['name'] ?? 'unknow',
        image: json['image'] ?? 'unknow',
        status: json['status'] ?? 'unknow',
        species: json['species'] ?? 'unknow',
        origin: json['origin']['name'] ?? 'unknow'
    );
  }
}