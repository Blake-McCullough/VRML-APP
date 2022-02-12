import 'package:VRML_APP/search/player/playerhttp.dart';

import 'package:VRML_APP/search/team/teamidresult.dart';

import 'package:flutter/material.dart';
import 'package:VRML_APP/profile/profile.dart';

class PlayerResults extends StatefulWidget {
  final String playerID;
  const PlayerResults({
    Key? key,
    required this.playerID,
  }) : super(key: key);

  @override
  _PlayerResultsState createState() => _PlayerResultsState();
}

class _PlayerResultsState extends State<PlayerResults> {
  late Future<Map<String, dynamic>> parJson =
      getPlayerSearchID(widget.playerID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Results'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(physics: BouncingScrollPhysics(), children: [
              Container(
                margin: EdgeInsets.all(20),
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(host + snapshot.data!['userLogo']),
                      fit: BoxFit.fill),
                ),
              ),
              Column(
                children: [
                  const Text('Name',
                      style: TextStyle(
                          color: Colors.indigo,
                          decoration: TextDecoration.underline)),
                  Text(
                    snapshot.data!['playerName'],
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('country',
                            style: TextStyle(
                                color: Colors.indigo,
                                decoration: TextDecoration.underline)),
                        Text(
                          snapshot.data!['country'],
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Team Name',
                            style: TextStyle(
                                color: Colors.indigo,
                                decoration: TextDecoration.underline)),
                        Text(
                          snapshot.data!['teamName'].toString(),
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Team Role',
                            style: TextStyle(
                                color: Colors.indigo,
                                decoration: TextDecoration.underline)),
                        Text(
                          snapshot.data!['role'].toString(),
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text(
                    'Go To Team',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeamResults(
                                teamID: snapshot.data!['teamID'],
                              )),
                    );
                  },
                ),
              ),
            ]);
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());
            return Center(
              child: Text('an error occured :awkward:'),
            );
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
