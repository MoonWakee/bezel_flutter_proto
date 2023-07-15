import 'package:flutter/material.dart';
import 'package:Bezel/components/default_button.dart';
import 'package:Bezel/screens/navigator/navigator_screen.dart';
import 'package:Bezel/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        Text(
          "You are all set!\n\nWe will contact you\nthrough contact info!",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(26),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to Home",
            press: () {
              Navigator.pushNamed(context, NavigatorScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
