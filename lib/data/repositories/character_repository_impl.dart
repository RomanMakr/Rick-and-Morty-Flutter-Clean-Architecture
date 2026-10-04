import 'package:rickandmorti_clean_architecture/data/datasource/character_remote_datasource_impl.dart';

import '../../domain/entities/character_entity.dart';
import '../../domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSourceImpl remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Character>> getCharacters() async {
    final characterDtos =
        await remoteDataSource.fetchAllCharacters();

    final List<Character> characters = [];
    for (var dto in characterDtos) {
      characters.add(dto.toEntity());
    }

    return characters;
  }
}
