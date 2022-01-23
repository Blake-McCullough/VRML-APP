import 'dart:convert';

import 'package:VRML_APP/globalvariables.dart';

import 'package:VRML_APP/search/search.dart';
import 'package:http/http.dart' as http;

final _client = http.Client();
Future<List<Map<String, dynamic>>> getPlayersSearch() async {
  List<Map<String, dynamic>> decodedResponse;
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/' +
      searcharea +
      '/players/Search?name=' +
      userinput!;
  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  decodedResponse = (json.decode(response.body) as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList();
  return decodedResponse;
}

Future<Map<String, dynamic>> getPlayerSearchID() async {
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/Players/' + playerID;

  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  print(response);

  var data = jsonDecode(response.body);
  return data;
}
