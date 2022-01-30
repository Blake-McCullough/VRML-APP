import 'dart:core';

import 'package:VRML_APP/main.dart';
import 'package:http/http.dart' as http;

String? region;
final _client = http.Client();
Future<String> getcurrentgames() async {
  //Gets the json for the users info
  //Gets the json for the users info
  if (token == null) {
    return Future.error('No Token Set');
  } else {
    tokencode = 'Bearer ' + token;
    final response = await _client.get(
      Uri.parse('https://api.vrmasterleague.com/User/@MyMatches'),
      headers: {
        "content-type": "application/json",
        "Authorization": tokencode,
      },
    );
    print(response.body);
    print("_______________________________________");
    //Delay as server only allows one request per second
    await Future.delayed(Duration(seconds: 1));
    //Gets the json for the users team/teamsinfo

    //MERGES THE TWO RESPONSES

    if (response.body.isNotEmpty) {
      return response.body;
    } else {
      return Future.error('Empty Response');
    }
  }
}
