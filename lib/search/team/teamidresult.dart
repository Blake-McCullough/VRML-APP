import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/search/team/teamhttp.dart';
import 'package:VRML_APP/globalvariables.dart';

import 'teamplayerresult.dart';
import 'package:flutter/material.dart';

class TeamResults extends StatefulWidget {
  final String teamID;
  const TeamResults({
    Key? key,
    required this.teamID,
  }) : super(key: key);

  @override
  _TeamResultsState createState() => _TeamResultsState();
}

class _TeamResultsState extends State<TeamResults> {
  late Future<Map<String, dynamic>> parJson = getTeamSearchID(widget.teamID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Team Results'), backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<Map<String, dynamic>>(
        future: parJson,
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
                    const Text('Name',
                        style: TextStyle(
                            color: Colors.indigo,
                            decoration: TextDecoration.underline)),
                    Text(
                      snapshot.data!['name'],
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
                          const Text('Region',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['region'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Rank',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['rank'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Rank Worldwide',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['rankWorldwide'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('GP',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['gp'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('MMR',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['mmr'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('W',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['w'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('T',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['t'].toString(),
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('L',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline)),
                          Text(
                            snapshot.data!['l'].toString(),
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
                      'Players',
                      style: TextStyle(color: textcolour, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: buttoncolour,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeamPlayerResults(
                                    teamID: widget.teamID,
                                  )));
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                    child: Container(
                      child: Text('TEAM BIO:',
                          style: TextStyle(
                              color: textcolour,
                              decoration: TextDecoration.underline)),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 5, 8, 12),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            snapshot.data!['bio']['bioInfo'].toString(),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: textcolour,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
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
