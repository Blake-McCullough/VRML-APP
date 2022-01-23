import 'dart:core';
import 'package:VRML_APP/search/search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final _client = http.Client();
Future<List<Map<String, dynamic>>> getLeaderboards() async {
  List<Map<String, dynamic>> decodedResponse;
  //Gets the json for the users info
  String urlsearch =
      'https://api.vrmasterleague.com/' + searcharea! + '/Standings/';
  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  print(response.body);
  decodedResponse = (json.decode(response.body) as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList();
  return decodedResponse;
}
