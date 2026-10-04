import '../dto_models/character_dto.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterDto>> fetchAllCharacters();
}
