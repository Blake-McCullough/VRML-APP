import 'dart:convert';

import 'package:VRML_APP/loginpage.dart';
import 'package:VRML_APP/main.dart';

import 'package:VRML_APP/search/team/teamidresult.dart';
import 'package:VRML_APP/upcoming-games/upcominggameshttp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            print('----------');
            print(newData);
            if (newData['scheduled'].length == 0) {
              return Center(
                child: Text(
                  'No Upcoming Games!',
                  style: TextStyle(
                    color: textcolour,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: newData['scheduled'].length,
                  itemBuilder: (BuildContext context, int index) {
                    var dateFormat = DateFormat(
                        "hh:mm aa dd-MM-yyyy "); // you can change the format here
                    var utcDate = dateFormat.format(DateTime.parse(
                        newData['scheduled'][index]
                            ['dateScheduled'])); // pass the UTC time here
                    var localDate =
                        dateFormat.parse(utcDate, true).toLocal().toString();
                    var localformateddate =
                        dateFormat.format(DateTime.parse(localDate));
                    return Card(
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(host +
                                    newData['scheduled'][index]['homeTeam']
                                            ['logo']
                                        .toString()),
                                fit: BoxFit.fill),
                          ),
                        ),
                        title: Text(newData['scheduled'][index]['homeTeam']
                                ['name']
                            .toString()),
                        subtitle: Text("Time: " + localformateddate.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeamResults(
                                      teamID: newData['scheduled'][index]
                                          ['homeTeam']['id'])),
                            );
                          },
                          icon: Icon(Icons.more_vert),
                        ),
                      ),

                      //SizedBox(width: 20),
                    );
                  });
            }
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
                            color: textcolour,
                            decoration: TextDecoration.underline)),
                    Text(' to see this',
                        style: TextStyle(
                            fontSize: 30,
                            color: textcolour,
                            decoration: TextDecoration.underline)),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(
                          'Signin',
                          style:
                              TextStyle(color: buttontextcolour, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: buttoncolour,
                            fixedSize: const Size(210, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () async {
                          final reLoadPage = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );

                          if (reLoadPage) {
                            setState(() {
                              profileJson = getcurrentgames();
                            });
                          }
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
