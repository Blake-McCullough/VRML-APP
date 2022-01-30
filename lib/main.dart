import 'dart:convert';
import 'dart:math';
import 'package:VRML_APP/leaderboard/leaderboard.dart';
import 'package:VRML_APP/profile/profile.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/settings/settings.dart';
import 'package:crypto/crypto.dart';
import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
//import 'package:persistent_bottom_nav_bar_example_project/screens.dart';

import 'package:http/http.dart' as http;

final host = 'https://vrmasterleague.com';
var token;
final _client = http.Client();
var returnedresult;
void main() {
  runApp(
    MaterialApp(
      home: PersistantBar(),
    ),
  );
}

Codec<String, String> stringToBase64 = utf8.fuse(base64);
var tokencode;
String hashvalue = '';
var code;
var codeverifier;
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Codec<String, String> stringToBase64Url = utf8.fuse(base64);

class _MyAppState extends State<MyApp> {
  String _status = '';

  @override
  void initState() {
    super.initState();
  }

  void authenticate() async {
    final codeverifier = getRandomString(128);

    print(codeverifier);

    // ignore: unused_local_variable
    final url =
        'https://35.189.15.82/verifierencrypt?codeverifier=' + codeverifier;
    print(url);

    final callbackUrlScheme = 'foobar';

    try {
      final result = await FlutterWebAuth.authenticate(
          url: url, callbackUrlScheme: callbackUrlScheme);
      print(result);
      code = result.substring(22);
      print(code);
      setState(() {
        _status = 'Success!';

        code = code;
      });

      final msg = jsonEncode({
        "grant_type": "authorization_code",
        "client_id": "06971b36-1de1-4607-87f0-1b915f4a03c3",
        "redirect_uri": "https://35.189.15.82",
        "code": code.toString(),
        "code_verifier": codeverifier.toString(),
      });
      Map<String, String> headers = {'Content-Type': 'application/json'};
      print(msg);
      final daresponse = await _client.post(
          Uri.parse('https://api.vrmasterleague.com/User/token/'),
          headers: headers,
          body: msg);

      print(daresponse.body);
      if (daresponse.statusCode == 200) {
        Map<String, dynamic> parsedJsonToken = jsonDecode(daresponse.body);
        token = parsedJsonToken['access_token'];
        print(token);
      }
      Navigator.pop(context, true);
    } on PlatformException catch (e) {
      setState(() {
        _status = 'Got error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Status: $_status\n'),
              const SizedBox(height: 80),
              ElevatedButton(
                child: Text('Signin'),
                onPressed: () {
                  this.authenticate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
