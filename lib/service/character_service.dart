import 'dart:convert';

import 'package:harry_potter/model/character.dart';
import "package:http/http.dart" as http;

class CharacterService {
  Future<List<Character>> fetchCharacters() async {
    List<Character> list = List<Character>();
    http.Response response =
        await http.get("http://hp-api.herokuapp.com/api/characters");

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      list = json.map<Character>((item) => Character.fromJson(item)).toList();
      list.sort((a, b) => a.name.compareTo(b.name));
      return list;
    } else
      return null;
  }
}
