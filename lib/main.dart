
import 'package:workmanager/workmanager.dart';
import 'package:VRML_APP/homescreen/homescreen.dart';
import 'package:flutter/material.dart';


import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@drawable/icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  final MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
  tz.initializeTimeZones();
  final String localTimeZone = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(localTimeZone));
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  /// ↓↓ ADDED
  /// InheritedWidget style accessor to our State object.
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

Map<int, Color> primarycolor = {
  50: Color.fromRGBO(98, 0, 238, .1),
  100: Color.fromRGBO(98, 0, 238, .2),
  200: Color.fromRGBO(98, 0, 238, .3),
  300: Color.fromRGBO(98, 0, 238, .4),
  400: Color.fromRGBO(98, 0, 238, .5),
  500: Color.fromRGBO(98, 0, 238, .6),
  600: Color.fromRGBO(98, 0, 238, .7),
  700: Color.fromRGBO(98, 0, 238, .8),
  800: Color.fromRGBO(98, 0, 238, .9),
  900: Color.fromRGBO(98, 0, 238, 1),
};
Map<int, Color> primarydarkcolor = {
  50: Color.fromRGBO(187, 134, 252, .1),
  100: Color.fromRGBO(187, 134, 252, .2),
  200: Color.fromRGBO(187, 134, 252, .3),
  300: Color.fromRGBO(187, 134, 252, .4),
  400: Color.fromRGBO(187, 134, 252, .5),
  500: Color.fromRGBO(187, 134, 252, .6),
  600: Color.fromRGBO(187, 134, 252, .7),
  700: Color.fromRGBO(187, 134, 252, .8),
  800: Color.fromRGBO(187, 134, 252, .9),
  900: Color.fromRGBO(187, 134, 252, 1),
};
MaterialColor primarycolourscheme = MaterialColor(0xFF6200EE, primarycolor);
MaterialColor primarydarkcolourscheme = MaterialColor(0xFFBB86FC, primarycolor);

class _MyAppState extends State<MyApp> {
  /// 1) our themeMode "state" field
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
          primarySwatch: primarycolourscheme,
          primaryColor: Color.fromRGBO(229, 229, 229, 1),
          brightness: Brightness.light,
          backgroundColor: const Color(0xFFFFFF),
          dividerColor: Colors.white54,
          appBarTheme: AppBarTheme(
            color: Color.fromRGBO(55, 0, 179, 1),
          )),
      darkTheme: ThemeData(
          primarySwatch: primarydarkcolourscheme,
          primaryColor: Color.fromRGBO(30, 30, 30, 1),
          brightness: Brightness.dark,
          backgroundColor: const Color(0xFF121212),
          dividerColor: Colors.black12,
          appBarTheme: AppBarTheme(
            color: Color.fromRGBO(55, 0, 179, 1),
          )),

      themeMode: _themeMode, // 2) ← ← ← use "state" field here //////////////
      home: PersistantBar(),
    );
  }

  /// 3) Call this to change theme from any context using "of" accessor
  /// e.g.:
  /// MyApp.of(context).changeTheme(ThemeMode.dark);
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
