import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:persistent_bottom_nav_bar_example_project/screens.dart';

import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;

String? token;
final _client = http.Client();
var returnedresult;
void main() {
  runApp(
    MaterialApp(
      home: MainScreen(),
    ),
  );
}

var hashvalue;
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

class _MyAppState extends State<MyApp> {
  String _status = '';

  @override
  void initState() {
    super.initState();
  }

  void authenticate() async {
    final codeverifier = getRandomString(128);
    final hashvalue = sha256.convert(ascii.encode(codeverifier));

    // ignore: unused_local_variable
    final tempurl =
        'https://vrmasterleague.com/OAuth?response_type=code&client_id=06971b36-1de1-4607-87f0-1b915f4a03c3&redirect_uri=http://localhost:8000&state=182889b1b42445fecf99045b40e6ce875f37ece577d4592435dd0eaa76cdadd9&scope=identify&code_challenge=' +
            hashvalue.toString() +
            '&code_challenge_method=S256';
    print(tempurl);
    final url = 'http://35.189.15.82:4000/?code=' + hashvalue.toString();
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
        "redirect_uri": "http://localhost:8000",
        "code": code,
        "code_verifier": codeverifier,
      });
      Map<String, String> headers = {'Content-Type': 'application/json'};
      print(msg);
      final response = await _client.post(
          Uri.parse('https://api.vrmasterleague.com/User/token/'),
          headers: headers,
          body: msg);

      if (response.statusCode != 200) {
        print("FAILED LOL");
      } else {
        print(response.body);
        final parsedJsonToken = jsonDecode(response.body);
        token = parsedJsonToken.data!['accesstoken'];
        setState(() {
          token = token;
        });
      }
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
        appBar: AppBar(
          title: const Text('Web Auth example'),
        ),
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
              ElevatedButton(
                  child: Text('Back'),
                  onPressed: () {
                    print(code);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
