import '../../domain/entities/character_entity.dart';

class CharacterDto {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String gender;

  CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.gender,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) {
    return CharacterDto(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
      gender: json['gender'],
    );
  }

  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
      gender: gender,
    );
  }

}
