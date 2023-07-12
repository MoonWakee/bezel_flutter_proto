import 'package:flutter/material.dart';
import 'package:Bezel/routes.dart';
import 'package:Bezel/screens/navigator/navigator_screen.dart';
import 'package:Bezel/screens/splash/splash_screen.dart';
import 'package:Bezel/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bezel Prototype',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
