import 'dart:convert';

import 'package:http/http.dart' as http;

final _client = http.Client();
Future<List<Map<String, dynamic>>> getPlayersSearch(String userinput) async {
  List<Map<String, dynamic>> decodedResponse;
  //Gets the json for the users info
  String urlsearch =
      'https://api.vrmasterleague.com/Players/Search?name=' + userinput;
  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  decodedResponse = (json.decode(response.body) as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList();
  return decodedResponse;
}

Future<Map<String, dynamic>> getPlayerSearchID(String playerID) async {
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/Players/' + playerID;

  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  print(response);
  print(response.body);
  var data = jsonDecode(response.body);
  return data;
}
