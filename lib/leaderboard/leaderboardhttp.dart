import 'dart:core';

import 'package:http/http.dart' as http;

String? region;
final _client = http.Client();
Future<String> getLeaderboards(
    String leaderboardlocation, String leaderboardgame) async {
  //Gets the json for the users info
  String urlsearch = 'https://api.vrmasterleague.com/' +
      leaderboardgame +
      '/Standings/?region=' +
      leaderboardlocation;
  print(urlsearch);

  final response = await _client.get(
    Uri.parse(urlsearch),
  );
  print(response.body);
  return response.body;
}
