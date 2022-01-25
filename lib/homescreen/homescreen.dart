import 'package:VRML_APP/comingsoon.dart';
import 'package:VRML_APP/leaderboard/leaderboard.dart';
import 'package:VRML_APP/profile/profile.dart';
import 'package:VRML_APP/search/search.dart';

import 'package:VRML_APP/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:VRML_APP/globalvariables.dart';
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
      PersistentTabController(initialIndex: 1);
  List<Widget> _buildScreens() {
    return [Profile(), Search(), MainScreen(), Leaderboard(), Settings()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: iconcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: iconcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: iconcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.leaderboard),
        title: ("Leaderboard"),
        activeColorPrimary: iconcolor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: iconcolor,
      ),
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
      backgroundColor: appbarcolor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
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
          backgroundColor: appbarcolor),
      backgroundColor: colourscheme,
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
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Made By Blake McCullough',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Discord - Spoiled_Kitten#4911',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'https://github.com/Blake-McCullough/',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'privblakemccullough@protonmail.com',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'This is the alpha release :)',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Found a bug or have a recommendation?',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
              Text(
                'Message me on discord!',
                style: TextStyle(
                  color: textcolour,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
