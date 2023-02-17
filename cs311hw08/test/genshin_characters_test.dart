import 'package:cs311hw08/genshin_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'genshin_characters_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('GenshinCharacters', () {
    test('get GenshinCharacters success case', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
          .thenAnswer((_) async => http.Response(
              '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
      expect(await fetchCharacters(client), isA<GenshinCharacters>());
    });

    test('get GenshinCharacters fail case', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(fetchCharacters(client), throwsException);
    });
  });

  group('CharaterInfo', () {
    test('get Character Info success case', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
          .thenAnswer((_) async => http.Response(
              '{"name":"Albedo","vision":"Geo","weapon":"Sword","nation":"Mondstadt","description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius."}',
              200));
      expect(await fetchCharacterInfo(client, 'albedo'), isA<CharacterInfo>());
    });

    test('get Character Info fail case', () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(fetchCharacterInfo(client, 'albedo'), throwsException);
    });
  });
}
