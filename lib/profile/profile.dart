import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/profile/userhttp.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:VRML_APP/globalvariables.dart';

//CREATES THE PROFILE CRAP
class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<Map<String, dynamic>> parJson = getUserDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const Text('Username',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                    Text(snapshot.data!['username']),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Discord:',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline)),
                          Text(snapshot.data!['discordTag']),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Team/s:',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline)),
                          Text(teamname!),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('TimeZone:',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline)),
                          Text(snapshot.data!['timezone']),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Country:',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline)),
                          Text(snapshot.data!['country']),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        settings: RouteSettings(name: '/profile'),
                        screen: MyApp(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.scaleRotate,
                      );
                    },
                    child: Text(
                      "Edit profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      //get ya mum bitch();
                    },
                    child: Text(
                      "Get Token",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.stackTrace);
            print(snapshot.error.toString());

            return Center(
                child: ElevatedButton(
                    child: Text(
                        'Signin(This does not work at the current time YOU BABOON)'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
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
