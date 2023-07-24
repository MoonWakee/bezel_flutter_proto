import 'package:Bezel/constants.dart';
import 'package:Bezel/screens/interior/interior_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class InteriorPosts extends StatelessWidget {
  const InteriorPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            noMore: false,
            title: "Trending Interior Posts",
            press: () {
              var snackBar = SnackBar(
                content: Text('Trending Interior Page'),
                duration: Duration(milliseconds: 800),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(20)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InteriorPage(
                        image: "assets/images/stand_lamp.jpg",
                        category: "#East Village #Living Room",
                        subtext: "Bezel was my first choice to get..",
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: "special_offer_card_1",
                  child: SpecialOfferCard(
                    image: "assets/images/stand_lamp.jpg",
                    category: "#East Village #Living Room",
                    subtext: "Bezel was my first choice to get..",
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InteriorPage(
                        image: "assets/images/cozy_home.jpg",
                        category: "#Cozy #LIC #Studio",
                        subtext: "Studio remodeled under \$500..",
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: "special_offer_card_2",
                  child: SpecialOfferCard(
                    image: "assets/images/cozy_home.jpg",
                    category: "#Cozy #LIC #Studio",
                    subtext: "Studio remodeled under \$500..",
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.subtext,
  }) : super(key: key);

  final String category, image, subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align text to the start (left)
      children: [
        SizedBox(
          width: getProportionateScreenWidth(200),
          height: getProportionateScreenWidth(200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            category,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(13),
                fontWeight: FontWeight.w800,
                color: kPrimaryColor),
          ),
        ),
        SizedBox(height: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            subtext,
            style: TextStyle(fontSize: getProportionateScreenWidth(12)),
          ),
        ),
      ],
    );
  }
}
