import 'package:flutter/material.dart';
import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
    required this.onPressed,
  }) : super(key: key);

  final MenuState selectedMenu;
  final Function(MenuState) onPressed;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  MenuState _currentMenu = MenuState.home;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);

    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildMenuItem(
              MenuState.home,
              "Home",
              Icons.home,
              Icons.home_outlined,
              inActiveIconColor,
            ),
            buildMenuItem(
              MenuState.shopping,
              "Shopping",
              Icons.shopping_bag,
              Icons.shopping_bag_outlined,
              inActiveIconColor,
            ),
            buildMenuItem(
              MenuState.consult,
              "Consulation",
              Icons.contact_mail,
              Icons.contact_mail_outlined,
              inActiveIconColor,
            ),
            buildMenuItem(
              MenuState.profile,
              "Profile",
              Icons.account_circle,
              Icons.account_circle_outlined,
              inActiveIconColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    MenuState menuState,
    String label,
    IconData filledIconData,
    IconData outlinedIconData,
    Color inActiveIconColor,
  ) {
    final isSelected = _currentMenu == menuState;
    final iconColor = isSelected ? kPrimaryColor : inActiveIconColor;
    final labelColor = isSelected ? kPrimaryColor : inActiveIconColor;
    final icon = isSelected ? filledIconData : outlinedIconData;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _currentMenu = menuState;
            widget.onPressed(menuState);
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: labelColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
