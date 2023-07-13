import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ChangableCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/sale.png",
        "text": "On Sale",
        "color": Color.fromARGB(255, 255, 206, 138)
      },
      {
        "icon": "assets/icons/flash.png",
        "text": "Flash Deal",
        "color": Color.fromARGB(255, 124, 0, 146)
      },
      {
        "icon": "assets/icons/best.png",
        "text": "BestSeller",
        "color": Color.fromARGB(255, 254, 235, 209)
      },
      {
        "icon": "assets/icons/trending.png",
        "text": "Trending",
        "color": Colors.black
      },
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
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
                width: getProportionateScreenWidth(55),
                height: getProportionateScreenWidth(55),
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
