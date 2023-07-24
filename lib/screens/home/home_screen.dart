import 'package:Bezel/screens/home/components/four_posts.dart';
import 'package:Bezel/screens/home/components/multiple_posts.dart';
import 'components/changable_categoreis.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/discount_banner.dart';
import 'components/headerComponents/search_header.dart';
import 'components/popular_products.dart';
import 'components/Interior_posts.dart';

class HomeScreen extends StatelessWidget {
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
                  DiscountBanner(),
                  ChangableCategories(),
                  Container(
                    height: getProportionateScreenWidth(6),
                    width: double.infinity,
                    color: Color.fromRGBO(206, 206, 206, 0.2),
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  InteriorPosts(),
                  SizedBox(height: getProportionateScreenWidth(30)),
                  Container(
                    height: getProportionateScreenWidth(6),
                    width: double.infinity,
                    color: Color.fromRGBO(206, 206, 206, 0.2),
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  FourPosts(title: 'Your Dream House Interior'),
                  SizedBox(height: getProportionateScreenWidth(30)),
                  Container(
                    height: getProportionateScreenWidth(6),
                    width: double.infinity,
                    color: Color.fromRGBO(206, 206, 206, 0.2),
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  PopularProducts(),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  Container(
                    height: getProportionateScreenWidth(6),
                    width: double.infinity,
                    color: Color.fromRGBO(206, 206, 206, 0.2),
                  ),
                  SizedBox(height: getProportionateScreenWidth(15)),
                  MultiplePosts(),
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
