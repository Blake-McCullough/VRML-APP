import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:VRML_APP/leaderboard/leaderboardhttp.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/search/team/teamidresult.dart';

//CREATES THE SearchResults CRAP
class LeaderboardResults extends StatefulWidget {
  const LeaderboardResults({
    Key? key,
  }) : super(key: key);

  @override
  _LeaderboardResultsState createState() => _LeaderboardResultsState();
}

class _LeaderboardResultsState extends State<LeaderboardResults> {
  Future<String> parJson = getLeaderboards();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard for $searcharea'),
      ),
      backgroundColor: colourscheme,
      body: FutureBuilder<String>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var newData = json.decode(snapshot.data.toString());

            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6, bottom: 16, left: 16, right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  (Container(
                                    margin: EdgeInsets.all(20),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              host + newData[index]['logo']),
                                          fit: BoxFit.fill),
                                    ),
                                  )),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => MainScreen()));
                                    },
                                    child: Text(
                                      newData[index]['rank'].toString(),
                                      //'Note Title',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => MainScreen()));
                                    },
                                    child: Text(
                                      newData[index]['name'].toString(),
                                      //'Note Title',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                ]),
                                Column(children: <Widget>[
                                  Row(children: <Widget>[
                                    SizedBox(
                                      width: 65.0,
                                    ),
                                    Text(
                                      "GP: " + newData[index]['gp'].toString(),
                                      //'Note Text',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "W: " + newData[index]['w'].toString(),
                                      //'Note Text',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "T: " + newData[index]['t'].toString(),
                                      //'Note Text',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "L: " + newData[index]['l'].toString(),
                                      //'Note Text',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                  ]),
                                ]),
                              ],
                            ),
                            //SizedBox(width: 20),
                          ],
                        ),
                      ]),
                ),
              );
            });
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());

            return Center(
                child: ElevatedButton(
                    child: Text('An error occured :awkward:'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    }));
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
