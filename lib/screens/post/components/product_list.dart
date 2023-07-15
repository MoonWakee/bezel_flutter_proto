import 'package:Bezel/models/Product.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'custom_card.dart';
import 'package:Bezel/models/Product.dart';

class ProductList extends StatelessWidget {
  static String routeName = "/products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: SizeConfig.screenWidth * 0.9,
                height: SizeConfig.screenHeight * 0.06,
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) => print(value),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(9),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: "Search products to tag...",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomCard(
                title: 'CaliTime Pack of 2 Soft Canvas..',
                image: 'assets/images/yellow_pillow.png',
                product: demoProducts[2],
              ),
              SizedBox(height: 20),
              CustomCard(
                title: 'Side Tables Laptop Table Nordic..',
                image: 'assets/images/yellow_table.png',
                product: demoProducts[3],
              ),
              SizedBox(height: 20),
              CustomCard(
                title: 'Emvency Throw Pillow Cover Car..',
                image: 'assets/images/black_pillow.png',
                product: demoProducts[1],
              ),
              SizedBox(height: 20),
              CustomCard(
                title: 'Simple Designs LF2000-BLK Lamp',
                image: 'assets/images/lamp_yellow.png',
                product: demoProducts[0],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
