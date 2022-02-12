import 'dart:convert';

import 'package:http/http.dart' as http;

final _client = http.Client();

Future<List<Map<String, dynamic>>> getTeamSearch(
    String searcharea, String userinput) async {
  List<Map<String, dynamic>> decodedResponse;
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/' +
      searcharea +
      '/Teams/Search?name=' +
      userinput;
  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  decodedResponse = (json.decode(response.body) as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList();
  print(response);
  return decodedResponse;
}

Future<Map<String, dynamic>> getTeamSearchID(String teamID) async {
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/Teams/' + teamID;

  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  print(response);
  print(response.body);
  var data = jsonDecode(response.body);
  return data;
}

Future<Map<String, dynamic>> getTeamPlayerSearchID(String teamID) async {
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/Teams/' + teamID;

  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  print(response);

  var data = jsonDecode(response.body);
  return data;
}
