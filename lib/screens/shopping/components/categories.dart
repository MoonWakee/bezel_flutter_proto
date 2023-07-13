import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "image": "assets/images/refrigerator.png",
        "text": "Home Appliances",
        "additionalText": "Additional Text 1",
      },
      {
        "image": "assets/images/furniture.png",
        "text": "Furniture",
        "additionalText": "Additional Text 2",
      },
      {
        "image": "assets/images/deco.png",
        "text": "Decorations",
        "additionalText": "Additional Text 3",
      },
      {
        "image": "assets/images/kitchen.png",
        "text": "Kitchenware",
        "additionalText": "Additional Text 4",
      },
      {
        "image": "assets/images/household.png",
        "text": "Household Goods",
        "additionalText": "Additional Text 5",
      },
      // Add more categories as needed
    ];

    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Categories",
            press: () {
              var snackBar = SnackBar(
                content: Text('Categories Page'),
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
            children: List.generate(
              categories.length,
              (index) => CategoryCard(
                image: categories[index]["image"],
                text: categories[index]["text"],
                additionalText: categories[index]["additionalText"],
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text('${categories[index]["text"]} Page'),
                    duration: Duration(milliseconds: 800),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.text,
    required this.additionalText,
    required this.onTap,
  }) : super(key: key);

  final String? image;
  final String? text;
  final String? additionalText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(108),
        margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image!,
                  alignment: Alignment.center,
                  width: getProportionateScreenWidth(80),
                  height: getProportionateScreenWidth(72),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Text(
                      text!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
