import 'dart:convert';

import 'package:VRML_APP/main.dart';
import 'package:http/http.dart' as http;
import 'package:VRML_APP/profile/profile.dart';

final _client = http.Client();

Future<Map<String, dynamic>> getUserDetails() async {
  //Gets the json for the users info
  if (token == null) {
    return Future.error('No Token Set');
  } else {
    tokencode = 'Bearer ' + token;
    final response = await _client.get(
      Uri.parse('https://api.vrmasterleague.com/User/@Me'),
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
    final response2 = await _client.get(
      Uri.parse('https://api.vrmasterleague.com/User/@MyTeams'),
      headers: {
        "content-type": "application/json",
        "Authorization": token,
      },
    );

    var data;
    //MERGES THE TWO RESPONSES

    if (response.body.isNotEmpty) {
      data = jsonDecode(response.body);

      //data.addAll(jsonDecode(response2.body));
      // Map<String, dynamic> myteamsJson = data;
      //final myteamslist = myteamsJson["teams"];
      //final myteamsmap = myteamslist[0];
      //final myteamsname = myteamsmap["name"];
      //teamname = myteamsname;
      print(response2.body);
      print("_______________________________________");
      print(data);
      return data;
    } else {
      return Future.error('Empty Response');
    }
  }
}
