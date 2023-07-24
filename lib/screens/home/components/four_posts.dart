import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class FourPosts extends StatelessWidget {
  const FourPosts({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SectionTitle(
          noMore: true,
          title: title,
          press: () {
            var snackBar = SnackBar(
              content: Text(title),
              duration: Duration(milliseconds: 800),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
      SizedBox(height: getProportionateScreenWidth(20)),
      Column(children: [
        Row(children: [
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text('Tropical Bedroom'),
                    duration: Duration(milliseconds: 800),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Hero(
                    tag: "house_1",
                    child: FourCard(
                      image: "assets/images/dreamhouse_1.jpg",
                      category: "Tropical Bedroom",
                    ))),
          ),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text('Futuristic Hallway'),
                    duration: Duration(milliseconds: 800),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Hero(
                    tag: "house_2",
                    child: FourCard(
                      image: "assets/images/dreamhouse_2.jpg",
                      category: "Futuristic Hallway",
                    ))),
          ),
        ]),
        SizedBox(height: getProportionateScreenHeight(10)),
        Row(children: [
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text('Cozy Study'),
                    duration: Duration(milliseconds: 800),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Hero(
                    tag: "house_3",
                    child: FourCard(
                      image: "assets/images/dreamhouse_3.jpg",
                      category: "Cozy Study",
                    ))),
          ),
          Expanded(
            child: GestureDetector(
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text('Hotel-Like Bedroom'),
                    duration: Duration(milliseconds: 800),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Hero(
                    tag: "house_4",
                    child: FourCard(
                      image: "assets/images/dreamhouse_4.jpg",
                      category: "Hotel-Like Bedroom",
                    ))),
          ),
        ]),
      ]),
    ]);
  }
}

class FourCard extends StatelessWidget {
  const FourCard({
    Key? key,
    required this.category,
    required this.image,
  }) : super(key: key);

  final String category, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align text to the start (left)
      children: [
        SizedBox(
          width: getProportionateScreenWidth(160),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.fitHeight,
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
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                category,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(13),
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor),
              )),
        ]),
      ],
    );
  }
}
