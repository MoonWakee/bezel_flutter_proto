import 'package:flutter/material.dart';
import '../../../size_config.dart';

class ChangableCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/shopping.png",
        "text": "Shopping",
        "color": Color.fromARGB(255, 248, 189, 164)
      },
      {
        "icon": "assets/icons/deal.png",
        "text": "Limited Sale",
        "color": Color.fromARGB(255, 116, 193, 248)
      },
      {
        "icon": "assets/icons/search.png",
        "text": "Find New",
        "color": Color.fromARGB(255, 195, 243, 206)
      },
      {
        "icon": "assets/icons/heart.png",
        "text": "For You",
        "color": Color.fromARGB(255, 175, 171, 245)
      },
      {
        "icon": "assets/icons/shipping.png",
        "text": "Flash Ship",
        "color": Color.fromARGB(255, 252, 143, 147)
      },
      {
        "icon": "assets/icons/moving.png",
        "text": "EZ Moving",
        "color": Color.fromARGB(255, 255, 237, 136)
      }
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              color: categories[index]["color"],
              press: () {
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
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final Color? color;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(80),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(0)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                icon!,
                width: getProportionateScreenWidth(40),
                height: getProportionateScreenWidth(40),
              ),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
