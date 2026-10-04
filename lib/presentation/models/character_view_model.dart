import 'package:flutter/material.dart';

import '../../domain/entities/character_entity.dart';

class CharacterViewModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String gender;
  final IconData genderIcon;
  final Color genderColor;
  bool isFavorite; 

  CharacterViewModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.gender,
    required this.genderColor,
    required this.genderIcon,
    this.isFavorite = false,
  });

  factory CharacterViewModel.fromEntity(Character characterEntity) {
    IconData icon;
    Color color;

    switch (characterEntity.gender) {
      case 'Male':
        icon = Icons.male;
        color = Colors.black;
        break;
      case 'Female':
        icon = Icons.female;
        color = Colors.pink;
        break;
      default:
        icon = Icons.help_outline;
        color = Colors.grey;
    }

    return CharacterViewModel(
      id: characterEntity.id,
      name: characterEntity.name,
      status: characterEntity.status,
      species: characterEntity.species,
      image: characterEntity.image,
      gender: characterEntity.gender,
      genderIcon: icon,
      genderColor: color,
    );

  }
}
