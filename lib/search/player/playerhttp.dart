import 'dart:convert';

import 'package:http/http.dart' as http;

final _client = http.Client();
Future<List<Map<String, dynamic>>> getPlayersSearch(
    String gamechoice, String userinput) async {
  List<Map<String, dynamic>> decodedResponse;
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/' +
      gamechoice +
      '/players/Search?name=' +
      userinput;
  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  decodedResponse = (json.decode(response.body) as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList();
  return decodedResponse;
}
