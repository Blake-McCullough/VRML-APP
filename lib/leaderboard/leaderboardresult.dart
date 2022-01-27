import 'dart:convert';

import 'package:VRML_APP/leaderboard/leaderboard.dart';
import 'package:flutter/material.dart';

import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:VRML_APP/leaderboard/leaderboardhttp.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/search/team/teamidresult.dart';

//CREATES THE SearchResults CRAP
class LeaderboardResults extends StatefulWidget {
  final String leaderboardlocation;
  final String leaderboardgame;
  const LeaderboardResults({
    required this.leaderboardlocation,
    required this.leaderboardgame,
    Key? key,
  }) : super(key: key);

  @override
  _LeaderboardResultsState createState() => _LeaderboardResultsState();
}

class _LeaderboardResultsState extends State<LeaderboardResults> {
  late Future<String> parJson =
      getLeaderboards(widget.leaderboardlocation, widget.leaderboardgame);
  late String leaderboard = widget.leaderboardlocation +
      " " +
      widget.leaderboardgame +
      ' Leaderboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(leaderboard), backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<String>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var newData = json.decode(snapshot.data.toString());

            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(host + newData[index]['logo']),
                          fit: BoxFit.fill),
                    ),
                  ),
                  title: Text(newData[index]['rank'].toString() +
                      ") " +
                      newData[index]['name'].toString()),
                  subtitle: Text(
                    "GP: " +
                        newData[index]['gp'].toString() +
                        " W: " +
                        newData[index]['w'].toString() +
                        " T: " +
                        newData[index]['t'].toString() +
                        " L: " +
                        newData[index]['l'].toString(),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TeamResults(teamID: newData[index]['id'])),
                      );
                    },
                    icon: Icon(Icons.more_vert),
                  ),
                ),

                //SizedBox(width: 20),
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
