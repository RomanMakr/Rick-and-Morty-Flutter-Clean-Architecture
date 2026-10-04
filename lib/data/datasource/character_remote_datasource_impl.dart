import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dto_models/character_dto.dart';
import 'character_remote_datasource.dart';

class CharacterRemoteDataSourceImpl
    implements CharacterRemoteDataSource {

  @override
  Future<List<CharacterDto>> fetchAllCharacters() async {
    final List<CharacterDto> characters = [];
    String? url = 'https://rickandmortyapi.com/api/character';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load page: ${response.statusCode}',
      );
    }

    final body = jsonDecode(response.body);
    final results = body['results'];

    for (final json in results) {
      characters.add(CharacterDto.fromJson(json));
    }

    return characters;
  }
}
