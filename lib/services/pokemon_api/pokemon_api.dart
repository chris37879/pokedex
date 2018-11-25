import 'dart:io';

import 'package:http/http.dart' as http;

class PokemonApi {
  static const String _apiEndpoint = "https://pokeapi.co/api/v2";

  /// Get a list of all pokemon
  static Future<String> getPokemonList() async =>
      await _makeRequest("/pokemon");

  /// Get pokemon
  static Future<String> getPokemonData({int byId, String byName}) async =>
      await _makeRequest("/pokemon/${byId ?? byName}");

  static Future<String> _makeRequest(String path) async {
    var response = await http.get(_apiEndpoint + path);

    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    }

    return Future.error(response);
  }
}
