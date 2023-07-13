import 'package:Bezel/screens/shopping/components/categories.dart';
import 'package:Bezel/screens/shopping/components/headerComponents/search_header.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/changable_categoreis.dart';
import 'components/discount_banner.dart';
import 'components/popular_products.dart';
import 'components/todays_deal.dart';

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
                  DiscountBanner(adIndex: 1, totalAds: 3),
                  ChangableCategories(),
                  Container(
                    height: getProportionateScreenWidth(6),
                    width: double.infinity,
                    color: Color.fromRGBO(206, 206, 206, 0.2),
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  Categories(),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  Container(
                    height: getProportionateScreenWidth(6),
                    width: double.infinity,
                    color: Color.fromRGBO(206, 206, 206, 0.2),
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  TodaysDeal(),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  Container(
                    height: getProportionateScreenWidth(6),
                    width: double.infinity,
                    color: Color.fromRGBO(206, 206, 206, 0.2),
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  PopularProducts(),
                  SizedBox(height: getProportionateScreenWidth(30)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
