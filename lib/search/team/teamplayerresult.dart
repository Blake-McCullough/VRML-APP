import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/search/team/teamhttp.dart';

import 'package:flutter/material.dart';
import 'package:VRML_APP/profile/profile.dart';

class TeamPlayerResults extends StatefulWidget {
  final String teamID;
  const TeamPlayerResults({
    Key? key,
    required this.teamID,
  }) : super(key: key);

  @override
  _TeamPlayerResultsState createState() => _TeamPlayerResultsState();
}

class _TeamPlayerResultsState extends State<TeamPlayerResults> {
  late Future<Map<String, dynamic>> parJson =
      getTeamPlayerSearchID(widget.teamID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Members'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: parJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var itemCount = snapshot.data!['players'].length;
            var size = MediaQuery.of(context).size;

            /*24 is for notification bar on Android*/
            final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
            final double itemWidth = size.width / 2;
            return GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 2,
                children: List.generate(itemCount, (index) {
                  return Padding(
                    padding: index == snapshot.data!.length - 1
                        ? const EdgeInsets.fromLTRB(8, 12, 8, 12)
                        : const EdgeInsets.only(
                            bottom: 4, left: 4, right: 4, top: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 90,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(host +
                                      snapshot.data!['players'][index]['logo']),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Column(
                            children: [
                              Text('Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline)),
                              Text(
                                snapshot.data!['players'][index]['name'],
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Role',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline)),
                              Text(
                                snapshot.data!['players'][index]['role'],
                                style: TextStyle(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Country',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline)),
                              Text(
                                snapshot.data!['players'][index]['country'],
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }));
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
