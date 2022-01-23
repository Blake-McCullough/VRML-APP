import 'package:VRML_APP/leaderboard/leaderboardhttp.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/search/team/teamidresult.dart';
import 'package:VRML_APP/globalvariables.dart';

import 'package:flutter/material.dart';

//CREATES THE SearchResults CRAP
class LeaderboardResults extends StatefulWidget {
  const LeaderboardResults({
    Key? key,
  }) : super(key: key);

  @override
  _LeaderboardResultsState createState() => _LeaderboardResultsState();
}

class _LeaderboardResultsState extends State<LeaderboardResults> {
  Future<List<Map<String, dynamic>>> parJson = getLeaderboards();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colourscheme,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Center(
                    child: Text(
                  'Leaderboard for ' + searcharea,
                  style: TextStyle(
                    color: textcolour,
                  ),
                )),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "BACKKKKKKKK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                for (var i in snapshot.data!)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(host + i['image']),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Text(
                          i["rank"],
                          style: TextStyle(
                            color: textcolour,
                          ),
                        ),
                        Text(
                          i["name"],
                          style: TextStyle(
                            color: textcolour,
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                teamID = i["id"];
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TeamResults()),
                              );
                            },
                            child: Text(
                              "Go to team Info",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());
            return Center(
              child: Text(
                'an error occured :awkward:',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
