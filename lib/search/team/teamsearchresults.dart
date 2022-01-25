import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/search/team/teamhttp.dart';
import 'package:VRML_APP/search/team/teamidresult.dart';
import 'package:VRML_APP/globalvariables.dart';

import 'package:flutter/material.dart';

class TeamSearchResults extends StatefulWidget {
  const TeamSearchResults({
    Key? key,
  }) : super(key: key);

  @override
  _TeamSearchResultsState createState() => _TeamSearchResultsState();
}

class _TeamSearchResultsState extends State<TeamSearchResults> {
  Future<List<Map<String, dynamic>>> parJson = getTeamSearch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Leaderboard for $searcharea'),
          backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                          image: NetworkImage(
                              host + snapshot.data![index]['image']),
                          fit: BoxFit.fill),
                    ),
                  ),
                  title: Text(snapshot.data![index]['name'].toString()),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamResults(
                                  teamID: snapshot.data![index]['id'],
                                )),
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
