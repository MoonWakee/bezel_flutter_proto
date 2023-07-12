import 'package:Bezel/screens/shopping/components/headerComponents/search_header.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class ShoppingScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          SearchHeader(),
          SizedBox(height: getProportionateScreenHeight(10)),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // DiscountBanner(),
                  // Categories(),
                  // SpecialOffers(),
                  // SizedBox(height: getProportionateScreenWidth(30)),
                  // PopularProducts(),
                  // SizedBox(height: getProportionateScreenWidth(30)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
