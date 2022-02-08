import 'dart:convert';

import 'dart:math';

import 'package:VRML_APP/upcoming-games/upcominggames.dart';
import 'package:VRML_APP/upcoming-games/upcominggameshttp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'package:http/http.dart' as http;

import 'package:VRML_APP/profile/userhttp.dart';

String? teamname;
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

//CREATES THE PROFILE CRAP
class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<Map<String, dynamic>> profileJson = getUserDetails();
  String _status = 'Not-Signed-In';
  void resetme() async {
    setState(() {
      profileJson = getUserDetails();
    });
  }

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
      resetme();
    } on PlatformException catch (e) {
      setState(() {
        profileJson = getUserDetails();
        _status = 'Got error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: profileJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 225,
                  height: 225,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(host + snapshot.data!['logo']),
                        fit: BoxFit.fill),
                  ),
                ),
                Column(
                  children: [
                    Text('Username:',
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline)),
                    Text(snapshot.data!['username'], style: TextStyle())
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, //Center Row contents vertically,
                            children: [
                              Column(children: [
                                Text('Timezone:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.underline)),
                                Text(snapshot.data!['timezone'],
                                    style: TextStyle()),
                              ]),
                              Column(children: [
                                Text('Country:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.underline)),
                                Text(snapshot.data!['country'],
                                    style: TextStyle())
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            children: [
                              Text('Discord:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.underline)),
                              Text(snapshot.data!['discordTag'],
                                  style: TextStyle())
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ElevatedButton(
                              child: Text(
                                'Upcoming Games',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(210, 70),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpcomingGames()),
                                );
                              }),
                          SizedBox(
                            height: 30.0,
                          ),
                          ElevatedButton(
                            child: Text(
                              'Edit Profile (N/A)',
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(210, 70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              getcurrentgamesnotification();
                            },
                          ),
                        ])),
                SizedBox(
                  height: 60.0,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 225.0,
                ),
                Column(
                  children: [
                    Text('You must sign-in',
                        style: TextStyle(
                            fontSize: 30,
                            decoration: TextDecoration.underline)),
                    Text(' to see this',
                        style: TextStyle(
                            fontSize: 30,
                            decoration: TextDecoration.underline)),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(210, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () async {
                          this.authenticate();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ],
            );
            //return Center(
            //  child: ElevatedButton(
            //    child: Text('Signin'),
            //  onPressed: () {
            //  Navigator.push(
            //  context,
            //MaterialPageRoute(builder: (context) => Login()),
            //);
            //}));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
