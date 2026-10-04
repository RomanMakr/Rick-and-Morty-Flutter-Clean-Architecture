abstract class CharacterEvent {}

class LoadCharacters extends CharacterEvent {}

class ToggleFavorite extends CharacterEvent {
  final int characterId;

  ToggleFavorite(this.characterId);
}
