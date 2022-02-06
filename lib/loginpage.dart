import 'dart:convert';
import 'dart:math';

import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/upcoming-games/upcominggameshttp.dart';

import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

final host = 'https://vrmasterleague.com';
var token;
final _client = http.Client();
var returnedresult;
Codec<String, String> stringToBase64 = utf8.fuse(base64);
var tokencode;
String hashvalue = '';
var code;
var codeverifier;
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

Codec<String, String> stringToBase64Url = utf8.fuse(base64);

class _LoginState extends State<Login> {
  String _status = 'Not-Signed-In';

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
      getcurrentgamesnotification();
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
        appBar: AppBar(
            title: Text('SignIn'),
            automaticallyImplyLeading: false,
            backgroundColor: appbarcolor),
        backgroundColor: colourscheme,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Status: $_status\n',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(color: buttontextcolour, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: buttoncolour,
                    fixedSize: const Size(210, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
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
