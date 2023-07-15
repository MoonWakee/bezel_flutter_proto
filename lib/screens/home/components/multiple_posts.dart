import 'package:flutter/material.dart';
import 'package:Bezel/constants.dart';
import 'package:Bezel/screens/home/components/section_title.dart';
import 'package:Bezel/screens/interior/interior_screen.dart';

import '../../../../size_config.dart';
import '../../interior/interior_category.dart';

class MultiplePosts extends StatelessWidget {
  const MultiplePosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SectionTitle(
            title: "Today's Categories",
            press: () {
              var snackBar = SnackBar(
                content: Text('Today\'s Categories page'),
                duration: Duration(milliseconds: 800),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Column(children: [
          Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      var snackBar = SnackBar(
                        content: Text('Bedroom for Infants'),
                        duration: Duration(milliseconds: 800),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Hero(
                        tag: "special_offer_card_3",
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SpecialOfferCard(
                            image: "assets/images/multi_2.jpg",
                            category: "Bedroom for Infants",
                          ),
                        ))),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var snackBar = SnackBar(
                      content: Text('Fireplace Living Room'),
                      duration: Duration(milliseconds: 800),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Hero(
                      tag: "special_offer_card_4",
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SpecialOfferCard(
                            image: "assets/images/multi_1.jpg",
                            category: "Fireplace Living Room",
                          ))),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var snackBar = SnackBar(
                      content: Text('Colorful Living Room'),
                      duration: Duration(milliseconds: 800),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Hero(
                      tag: "special_offer_card_5",
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SpecialOfferCard(
                            image: "assets/images/multi_3.jpg",
                            category: "Colorful Living Room",
                          ))),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var snackBar = SnackBar(
                      content: Text('Daughter\'s Bedroom'),
                      duration: Duration(milliseconds: 800),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Hero(
                      tag: "special_offer_card_6",
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SpecialOfferCard(
                            image: "assets/images/multi_4.jpg",
                            category: "Daughter's Bedroom",
                          ))),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var snackBar = SnackBar(
                      content: Text('Minimalist Living Room'),
                      duration: Duration(milliseconds: 800),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Hero(
                      tag: "special_offer_card_7",
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SpecialOfferCard(
                            image: "assets/images/multi_5.jpg",
                            category: "Minimalist Living Room",
                          ))),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    var snackBar = SnackBar(
                      content: Text('Modernist Living Room'),
                      duration: Duration(milliseconds: 800),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Hero(
                      tag: "special_offer_card_8",
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SpecialOfferCard(
                            image: "assets/images/multi_6.jpg",
                            category: "Modernist Living Room",
                          ))),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ])
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
  }) : super(key: key);

  final String category, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(200),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
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
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            category,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(13),
              fontWeight: FontWeight.w800,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
