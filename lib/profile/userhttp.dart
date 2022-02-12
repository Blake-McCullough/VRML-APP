import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:VRML_APP/profile/profile.dart';

final _client = http.Client();

Future<Map<String, dynamic>> getUserDetails() async {
  //Gets the json for the users info
  print(token);
  if (token == null) {
    return Future.error('No Token Set');
  } else {
    tokencode = 'Bearer ' + token;
    final response = await _client.get(
      Uri.parse('https://api.vrmasterleague.com/Users/@Me'),
      headers: {
        "content-type": "application/json",
        "Authorization": tokencode,
      },
    );
    print(response.body);
    print("_______________________________________");

    var data;
    //MERGES THE TWO RESPONSES
    //Delay as server only allows one request per second

    //Gets the notifications

    if (response.body.isNotEmpty) {
      data = jsonDecode(response.body);

      print("_______________________________________");
      print(data);
      return data;
    } else {
      return Future.error('Empty Response');
    }
  }
}
