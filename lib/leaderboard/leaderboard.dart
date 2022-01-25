import 'package:VRML_APP/globalvariables.dart';
import 'package:VRML_APP/leaderboard/leaderboardresult.dart';
import 'package:VRML_APP/search/search.dart';

import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//CREATES THE PROFILE CRAP
class Leaderboard extends StatefulWidget {
  const Leaderboard({
    Key? key,
  }) : super(key: key);

  @override
  _Leaderboard createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Leaderboard'),
          automaticallyImplyLeading: false,
          backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
      body: FutureBuilder<Map<String, dynamic>>(
        builder: (context, snapshot) {
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      searcharea = 'Onward';
                    });
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/home'),
                      screen: LeaderboardResults(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    'Onward',
                    style: TextStyle(color: textcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(208, 189, 244, 1.0),
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      searcharea = 'EchoArena';
                    });
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/home'),
                      screen: LeaderboardResults(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    'Echo Arena',
                    style: TextStyle(color: textcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(208, 189, 244, 1.0),
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      searcharea = 'Pavlov';
                    });
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/home'),
                      screen: LeaderboardResults(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    'Pavlov',
                    style: TextStyle(color: textcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(208, 189, 244, 1.0),
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      searcharea = 'SnapShot';
                    });
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/home'),
                      screen: LeaderboardResults(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    'SnapShot',
                    style: TextStyle(color: textcolour, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(208, 189, 244, 1.0),
                      fixedSize: const Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
