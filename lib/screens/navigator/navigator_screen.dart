import 'package:Bezel/screens/post/post_screen.dart';
import 'package:Bezel/screens/shopping/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:Bezel/screens/home/home_screen.dart';
import 'package:Bezel/screens/profile/profile_screen.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';

class NavigatorScreen extends StatefulWidget {
  static String routeName = "/navigate";

  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  MenuState _selectedMenu = MenuState.home;

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (_selectedMenu) {
      case MenuState.home:
        body = HomeScreen();
        break;
      case MenuState.shopping:
        body = ShoppingScreen();
        break;
      case MenuState.profile:
        body = ProfileScreen();
        break;
      case MenuState.post:
        body = PostScreen();
        break;
      // Add cases for other menu states as needed
      default:
        body = Container();
    }

    return WillPopScope(
        onWillPop: () async {
          // Disable the back swipe gesture
          return false;
        },
        child: Scaffold(
          body: body,
          bottomNavigationBar: CustomBottomNavBar(
              selectedMenu: MenuState.home,
              onPressed: (menuState) {
                setState(() {
                  _selectedMenu = menuState;
                });
              }),
        ));
  }
}
