import '../entities/character_entity.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
}
