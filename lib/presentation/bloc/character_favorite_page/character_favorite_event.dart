import '../../models/character_view_model.dart';

abstract class CharacterFavoriteEvent {}

class LoadFavoriteCharacters extends CharacterFavoriteEvent {}

class ToggleFavoriteCharacter extends CharacterFavoriteEvent {
  final CharacterViewModel character;

  ToggleFavoriteCharacter(this.character);
}
