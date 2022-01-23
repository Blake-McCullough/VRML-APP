import 'package:VRML_APP/search/search.dart';
import 'package:VRML_APP/search/team/teamhttp.dart';
import 'package:VRML_APP/search/team/teamidresult.dart';
import 'package:VRML_APP/globalvariables.dart';

import 'package:flutter/material.dart';

//CREATES THE SearchResults CRAP
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
                  'Results for ' + userinput! + " in " + searcharea,
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
