import 'package:Bezel/models/Product.dart';
import 'package:flutter/material.dart';

import '../details/details_screen.dart';

class InteriorCategory extends StatelessWidget {
  final String image;
  final String category;
  final String subtext;

  const InteriorCategory({
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
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
              )
            ],
          ),
        ));
  }
}
