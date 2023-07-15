import 'package:flutter/material.dart';
import 'package:Bezel/models/Cart.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import '../../details/details_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.image,
    required this.product,
  }) : super(key: key);

  final String title;
  final String image;
  final Product product;

  @override
  Widget build(BuildContext context) {
    String key = title;

    return GestureDetector(
        onTap: () => Navigator.pop(context, product),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFF5F6F9),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(image),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    SizedBox(height: 10),
                  ],
                )
              ],
            )));
  }
}
