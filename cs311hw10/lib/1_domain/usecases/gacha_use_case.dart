import 'dart:math';

import 'package:cs311hw10/1_domain/entities/genshin_character_entity.dart';
import 'package:cs311hw10/2_data/repositories/gacha_repo_impl.dart';
import 'package:flutter/material.dart';

class GachaUseCase extends ChangeNotifier {
  static const genshinCharInArea = {
    "mondstadt": [
      "jean",
      "amber",
      "lisa",
      "kaeya",
      "barbara",
      "diluc",
      "razor",
      "venti",
      "klee",
      "bennett",
      "noelle",
      "fischl",
      "sucrose",
      "mona",
      "diona",
      "albedo",
      "rosaria",
      "eula",
      "aloy",
    ],
    "liyue": [
      "xiao",
      "beidou",
      "ningguang",
      "xiangling",
      "xingqiu",
      "chongyun",
      "qiqi",
      "keqing",
      "tartaglia",
      "zhongli",
      "xinyan",
      "ganyu",
      "hu-tao",
      "yanfei",
      "shenhe",
      "yun-jin",
      "yelan",
    ],
    "inazuma": [
      "ayaka",
      "kazuha",
      "yoimiya",
      "sayu",
      "raiden",
      "sara",
      "kokomi",
      "thoma",
      "arataki-itto",
      "gorou",
      "yae-miko",
      "ayato",
      "kuki-shinobu",
      "shikanoin-heizou",
    ],
    "sumeru": ["tighnari", "collei"],
    "outlander": [
      "traveler-anemo",
      "traveler-dendro",
      "traveler-geo",
      "traveler-electro"
    ]
  };

  static const List<String> areas = [
    "mondstadt",
    "liyue",
    "inazuma",
    "sumeru",
    // "outlander"
  ];

  GenshinCharacterEntity? randomCharacter;
  final gachaRepo = GachaRepoImpl();

  Future<GenshinCharacterEntity> getRandomCharacter() async {
    final area = areas[Random().nextInt(areas.length)];
    // final characters = await gachaRepo.getCharactersFromApi();
    // print(characters);
    final characters = genshinCharInArea[area];
    final randomCharacters = characters![Random().nextInt(characters.length)];
    // print(randomCharacters);
    randomCharacter = await gachaRepo.getCharacterInfo(randomCharacters);
    notifyListeners();
    return randomCharacter!;
  }
}
