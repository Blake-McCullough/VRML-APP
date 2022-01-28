import 'package:VRML_APP/comingsoon.dart';
import 'package:VRML_APP/main.dart';
import 'package:VRML_APP/profile/userhttp.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:VRML_APP/globalvariables.dart';

String? teamname;
final host = 'https://vrmasterleague.com';

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
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: appbarcolor,
        automaticallyImplyLeading: false,
      ),
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
                          Text('N/A'),
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
                SizedBox(
                  height: 60.0,
                ),
              ],
            );
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
                        onPressed: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: RouteSettings(name: '/profile'),
                            screen: Profile(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.scaleRotate,
                          );
                        },
                        child: Text(
                          "View profile (Only if previously signed in)",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Edit profile (N/A)",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
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
