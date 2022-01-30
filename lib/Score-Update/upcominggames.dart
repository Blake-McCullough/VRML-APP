import 'dart:convert';

import 'package:VRML_APP/Score-Update/scoreupdatehttp.dart';
import 'package:VRML_APP/comingsoon.dart';
import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/profile/userhttp.dart';
import 'package:VRML_APP/search/team/teamidresult.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:VRML_APP/globalvariables.dart';

String? teamname;
final host = 'https://vrmasterleague.com';

//CREATES THE PROFILE CRAP
class UpcomingGames extends StatefulWidget {
  const UpcomingGames({
    Key? key,
  }) : super(key: key);

  @override
  _UpcomingGamesState createState() => _UpcomingGamesState();
}

class _UpcomingGamesState extends State<UpcomingGames> {
  Future<String> profileJson = getcurrentgames();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('UpcomingGames'), backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<String>(
        future: profileJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var newData = json.decode(snapshot.data.toString());

            return ListView.builder(
                itemCount: newData['scheduled'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(host +
                                  newData['scheduled'][index]['awayTeam']
                                          ['logo']
                                      .toString()),
                              fit: BoxFit.fill),
                        ),
                      ),
                      title: Text(newData['scheduled'][index]['awayTeam']
                              ['name']
                          .toString()),
                      subtitle: Text("Time: " +
                          newData['scheduled'][index]['dateScheduled']
                              .toString()),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeamResults(
                                    teamID: newData[index]['awayTeam']['id'])),
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
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 225.0,
                ),
                Column(
                  children: [
                    const Text('Pick an option',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          final reLoadPage = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );

                          if (reLoadPage) {
                            setState(() {
                              profileJson = getcurrentgames();
                            });
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
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
            //MaterialPageRoute(builder: (context) => MyApp()),
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
