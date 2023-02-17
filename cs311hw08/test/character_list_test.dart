import 'package:cs311hw08/character_detail.dart';
import 'package:cs311hw08/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'character_list_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('CharacterList should display a list of characters',
      (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: CharacterList(client: client),
    )));
    await tester.pumpAndSettle();
    final findListView = find.byType(ListView);
    final listFinder = find.byType(Scrollable);
    final findListTile = find.byType(ListTile);
    await tester.scrollUntilVisible(
      findListView,
      500.0,
      scrollable: listFinder,
    );
    expect(findListView, findsOneWidget);
    expect(findListTile, findsWidgets);
  });

  testWidgets('CharacterList should display a list of characters',
      (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response(
            '["albedo","aloy","amber","arataki-itto","ayaka","ayato"]', 200));
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: CharacterList(client: client),
    )));
    await tester.pumpAndSettle();

    final findListTile = find.byType(ListTile);
    await tester.tap(findListTile.first);
    await tester.pumpAndSettle();
    expect(find.byType(CharacterDetail), findsOneWidget);
  });

  testWidgets('CharacterList display error', (tester) async {
    final client = MockClient();
    when(client.get(Uri.parse('https://api.genshin.dev/characters')))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: CharacterList(client: client),
    )));
    await tester.pumpAndSettle();

    final findTextError = find.byType(Text);
    expect(findTextError, findsOneWidget);
  });
}
