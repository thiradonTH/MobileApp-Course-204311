import 'package:cs311hw08/character_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Character detail should display a character detail.',
      (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
        .thenAnswer((_) async => http.Response(
            '{"name":"Albedo","vision":"Geo","weapon":"Sword","nation":"Mondstadt","description":"A genius known as the Kreideprinz, he is the Chief Alchemist and Captain of the Investigation Team of the Knights of Favonius."}',
            200));
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: CharacterDetail(client: client, name: "albedo"),
    )));
    await tester.pumpAndSettle();
    final findColumn = find.byType(Column);
    final findTextDetail =
        find.descendant(of: findColumn, matching: find.byType(Text));
    expect(findColumn, findsOneWidget);
    expect(findTextDetail, findsNWidgets(5));
  });

  testWidgets('Character detail should display an error.', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters/albedo')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: CharacterDetail(client: client, name: "albedo"),
    )));
    await tester.pumpAndSettle();
    final findTextError =
        find.descendant(of: find.byType(Scaffold), matching: find.byType(Text));

    expect(findTextError, findsNWidgets(2)); // Error + Title
  });
}
