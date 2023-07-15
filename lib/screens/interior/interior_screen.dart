import 'package:Bezel/models/Product.dart';
import 'package:flutter/material.dart';

import '../details/details_screen.dart';

class InteriorPage extends StatelessWidget {
  final String image;
  final String category;
  final String subtext;

  const InteriorPage({
    Key? key,
    required this.image,
    required this.category,
    required this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Interior Details'),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(image),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          category == "#East Village #Living Room"
                              ? "Bezel was my first choice to get interior styling advice from.\n\nFrom budget not over \$800, me and my husband wanted a light and refreshed styled living room. From looking at others' posts, I gathered the items that I want to place in my living room, and voilà, minimalist but light and fresh living room in front of our very eyes!"
                              : "Studio remodeled under \$500 and can't believe such atmosphere could be created!\n\nAs a student who typically needs to move around town much, I didn't want to use decent time and effort in interior styling; however with Bezel, I just added items that generate similar moods and after some arrangements, I definitely gained confidence!",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        // Add more details here as needed
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: category == "#East Village #Living Room",
                child: Positioned(
                  top: 110, // Y coordinate
                  left: 220, // X coordinate
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments:
                              ProductDetailsArguments(product: demoProducts[0]),
                        );
                      },
                      child: Text(demoProducts[0].subtitle),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(122, 203, 71, 0)))),
                ),
              ),
              Visibility(
                visible: category == "#East Village #Living Room",
                child: Positioned(
                  top: 270, // Y coordinate
                  left: 150, // X coordinate
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments:
                              ProductDetailsArguments(product: demoProducts[2]),
                        );
                      },
                      child: Text(demoProducts[2].subtitle),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(122, 203, 71, 0)))),
                ),
              ),
              Visibility(
                  visible: category == "#East Village #Living Room",
                  child: Positioned(
                    top: 220, // Y coordinate
                    left: 50, // X coordinate
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                                product: demoProducts[1]),
                          );
                        },
                        child: Text(demoProducts[1].subtitle),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(122, 203, 71, 0)))),
                  )),
              Visibility(
                  visible: category == "#East Village #Living Room",
                  child: Positioned(
                    top: 350, // Y coordinate
                    left: 160, // X coordinate
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                                product: demoProducts[3]),
                          );
                        },
                        child: Text(demoProducts[3].subtitle),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(122, 203, 71, 0)))),
                  )),
            ],
          ),
        ));
  }
}
