import 'package:rickandmortyproject/features/characters/domain/character.dart';

class CharacterModel extends Character{
  CharacterModel({
    required super.id,
    required super.name,
    required super.image,
    required super.status,
    required super.species,
  });

  factory CharacterModel.fromJson(Map<String,dynamic> json){
    return CharacterModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        status: json['status'],
        species: json['species']
    );
  }
}