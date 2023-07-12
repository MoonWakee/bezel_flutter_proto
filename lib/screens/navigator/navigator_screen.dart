import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

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
      case MenuState.profile:
        body = ProfileScreen();
        break;
      // Add cases for other menu states as needed
      default:
        body = Container();
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.home,
          onPressed: (menuState) {
            setState(() {
              _selectedMenu = menuState;
            });
          }),
    );
  }
}
