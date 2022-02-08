import 'package:VRML_APP/leaderboard/leaderboard.dart';

import 'package:VRML_APP/profile/profile.dart';

import 'package:VRML_APP/search/search.dart';

import 'package:VRML_APP/settings/settings.dart';

import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PersistantBar extends StatefulWidget {
  const PersistantBar({
    Key? key,
  }) : super(key: key);

  @override
  _PersistantBar createState() => _PersistantBar();
}

class _PersistantBar extends State<PersistantBar> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);
  List<Widget> _buildScreens() {
    return [Profile(), Search(), MainScreen(), Leaderboard(), Settings()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: Color.fromRGBO(4, 218, 198, 1),
          inactiveColorPrimary: Color.fromRGBO(255, 255, 255, 1)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          title: ("Search"),
          activeColorPrimary: Color.fromRGBO(4, 218, 198, 1),
          inactiveColorPrimary: Color.fromRGBO(255, 255, 255, 1)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Color.fromRGBO(4, 218, 198, 1),
          inactiveColorPrimary: Color.fromRGBO(255, 255, 255, 1)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.leaderboard),
          title: ("Leaderboard"),
          activeColorPrimary: Color.fromRGBO(4, 218, 198, 1),
          inactiveColorPrimary: Color.fromRGBO(255, 255, 255, 1)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary: Color.fromRGBO(4, 218, 198, 1),
          inactiveColorPrimary: Color.fromRGBO(255, 255, 255, 1)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Color.fromRGBO(55, 0, 179, 1), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MainScreen extends State<MainScreen> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              Text(
                'HOME',
                style: TextStyle(),
              ),
              Text(
                'Made By Blake McCullough',
                style: TextStyle(),
              ),
              Text(
                'Discord - Spoiled_Kitten#4911',
                style: TextStyle(),
              ),
              Text(
                'https://github.com/Blake-McCullough/',
                style: TextStyle(),
              ),
              Text(
                'privblakemccullough@protonmail.com',
                style: TextStyle(),
              ),
              Text(
                'This is the alpha release :)',
                style: TextStyle(),
              ),
              Text(
                'Found a bug or have a recommendation?',
                style: TextStyle(),
              ),
              Text(
                'Message me on discord!',
                style: TextStyle(),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                    child: Container(
                      child: Text('LatestNews',
                          style: TextStyle(
                              color: Color.fromRGBO(121, 125, 246, 1.0),
                              fontSize: 23,
                              decoration: TextDecoration.underline)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 12),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'THE LATEST NEWS UPDATE WILL BE HERE!',
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
